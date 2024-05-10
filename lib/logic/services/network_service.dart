import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkService {
  static final NetworkService _networkService = NetworkService._internal();
  factory NetworkService() {
    return _networkService;
  }
  NetworkService._internal();

  final _networkConnectivity = Connectivity();
  final _networkStreamController = StreamController<bool>();
  Stream<bool> get networkStream => _networkStreamController.stream;

  void init() async {
    ConnectivityResult result = await _networkConnectivity.checkConnectivity();
    _checkStatus(result);
    _networkConnectivity.onConnectivityChanged.listen((result) {
      _checkStatus(result);
    });
  }

  void _checkStatus(ConnectivityResult result) async {
    bool isOnline = false;
    try {
      final result = await InternetAddress.lookup('example.com');
      isOnline = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      isOnline = false;
    }
    _networkStreamController.sink.add(isOnline);
  }

  void disposeStream() => _networkStreamController.close();
}
