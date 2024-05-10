// // ignore_for_file: avoid_print
// import 'dart:async';
// import 'dart:convert';
// import 'package:sda_explorers_app/data/models/message_model.dart';
// import 'package:sda_explorers_app/data/models/session.dart';
// import 'package:sda_explorers_app/logic/blocs/connectivity_bloc.dart';
// import 'package:sda_explorers_app/logic/services/storage_service.dart';
// import 'package:sda_explorers_app/main.dart';
// import 'package:socket_io_client/socket_io_client.dart';

// class SocketService {
//   static final SocketService _socketService = SocketService._internal();
//   factory SocketService() {
//     return _socketService;
//   }
//   SocketService._internal();

//   Socket? _socket;
//   bool isConnected = false;
//   final String endpoint = 'http://192.168.100.6:4267';
//   List<Message> messageQ = [];
//   final StreamController<ConnectivityStatus> _socketStreamController =
//       StreamController<ConnectivityStatus>();

//   final Map<String, ReqObserver> _observers = {};
//   final Map<String, String> _fingerPrintMap = {};
//   final _storage = StorageManager();

//   Future init() async {
//     if (_socket != null) {
//       _socket!.close();
//       _socket = null;
//     }
//     _socket = io(
//         endpoint,
//         OptionBuilder()
//             .setTransports(['websocket'])
//             .setReconnectionDelay(10)
//             .setAuth({'session': jsonEncode(await getSession())})
//             .build());

//     _socket!.onConnect((data) {
//       isConnected = true;
//       _socketStreamController.add(ConnectivityStatus.connected);
//       print('Connected');
//     });

//     _socket!.onConnectError((data) {
//       isConnected = false;
//       _socketStreamController.add(ConnectivityStatus.disconnected);
//       // print('Connect Error');
//     });
//     _socket!.onConnecting((data) {
//       _socketStreamController.add(ConnectivityStatus.connecting);
//       print('Connecting');
//     });

//     _socket!.onConnectTimeout((data) {
//       isConnected = false;
//       _socketStreamController.add(ConnectivityStatus.disconnected);
//       print("Connect Timeout");
//     });

//     _socket!.onError((data) {
//       isConnected = false;
//       _socketStreamController.add(ConnectivityStatus.disconnected);
//       print("Error");
//     });

//     _socket!.onDisconnect((data) {
//       isConnected = false;
//       _socketStreamController.add(ConnectivityStatus.disconnected);
//       print("Disconnected");
//     });

//     _socket!.onPing((data) {
//       _socket!.emit('pang');
//     });
//     _socket!.on('message', (data) {
//       var message = Message.fromString(data);
//       handleIncoming(message);
//     });
//   }

//   reloadApp() {
//     main();
//   }

//   Stream<ConnectivityStatus> get socketStream {
//     return _socketStreamController.stream;
//   }

//   Future<Session?> getSession() async {
//     var sessionString = await _storage.readData('session');
//     if (sessionString == null) {
//       return null;
//     }
//     return Session.fromJson(jsonDecode(sessionString));
//   }

//   void disposeStream() => _socketStreamController.close();

//   void send<M>(Message message) {
//     if (_socket == null) {
//       messageQ.add(message);
//     } else {
//       try {
//         _socket!.emit("message", message.toString());
//       } catch (error) {
//         if (_socket?.disconnected == true) {
//           messageQ.add(message);
//           _socket?.connect();
//         }
//       }
//     }
//   }

//   ReqObserver<T> listenTo<T>(String fingerPrint) {
//     return _getObserver<T>(fingerPrint);
//   }

//   Future<T> sendAndWait<T>(Message message) async {
//     final fingerPrint = _getFingerprint(message, FingerprintType.Unique);
//     var completer = Completer<T>();
//     send(message);
//     _fingerPrintMap[message.id] = fingerPrint;
//     ReqObserver<T> observer = _getObserver<T>(fingerPrint);
//     observer.observable.stream.first
//         .then((value) => {completer.complete(value.data)});
//     return completer.future;
//   }

//   ReqObserver<T> sendAndListen<T>(Message message) {
//     final fingerPrint =
//         _getFingerprint(message, FingerprintType.SubjectAndData);
//     send(message);
//     _fingerPrintMap[message.id] = fingerPrint;
//     ReqObserver<T> observer = _getObserver<T>(fingerPrint);
//     return observer;
//   }

//   void handleIncoming(Message<dynamic> message) {
//     _handleError(message);
//     var fingerPrint = _fingerPrintMap[message.id] ?? message.subject;
//     var observer = _observers[fingerPrint];
//     if (observer != null) {
//       observer.observable._controller.add(message);
//     } else {
//       print('No observer for incoming request');
//       print(message);
//     }
//   }

//   void _handleError(Message<dynamic> message) {
//     if (message.error != null) {
//       print("ERROR from backend server;");
//       print(message.error);
//     }
//   }

//   ReqObserver<T> _getObserver<T>(String fingerPrint) {
//     if (_observers[fingerPrint] == null) {
//       _observers[fingerPrint] = ReqObserver<T>(fingerPrint, MessageSubcriber());
//     }
//     return _observers[fingerPrint] as ReqObserver<T>;
//   }

//   String _getFingerprint<T>(Message message, FingerprintType fpType) {
//     var output = '';
//     switch (fpType) {
//       case FingerprintType.Subject:
//         output = message.subject;
//         break;
//       case FingerprintType.SubjectAndData:
//         output = message.subject + json.encode(message.data);
//         break;
//       case FingerprintType.Unique:
//         output = json.encode(message.id);
//         break;
//     }
//     return output;
//   }
// }

// abstract class MessageSubcriberAbstract<T> {
//   Stream<Message> get stream;
//   Message? lastValue;
//   Message receive(Message message);
// }

// class MessageSubcriber<T> implements MessageSubcriberAbstract {
//   final StreamController<Message> _controller =
//       StreamController<Message>.broadcast();
//   @override
//   Stream<Message> get stream => _controller.stream;

//   @override
//   Message? lastValue;

//   @override
//   receive(Message message) {
//     lastValue = message;
//     _controller.add(message);
//     return message;
//   }
// }

// class ReqObserver<T> {
//   String fingerPrint;
//   MessageSubcriber<T> observable;
//   ReqObserver(this.fingerPrint, this.observable);
// }

// enum FingerprintType {
//   Subject,
//   SubjectAndData,
//   Unique,
// }
