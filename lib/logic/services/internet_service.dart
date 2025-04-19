import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> isConnected() async {
  List<ConnectivityResult> results = await Connectivity().checkConnectivity();
  return !results.contains(ConnectivityResult.none);
}
