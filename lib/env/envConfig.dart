import 'package:peerrev/api/exception.dart';
import 'package:peerrev/api/baseHelper.dart';

class Constants {
  String mainServerAddress =
      const String.fromEnvironment("MAIN_SERVER_ADDRESS");
}

class Init {
  bool isConnected = true;

  Future<bool> initServices() async {
    await _backendService();

    return isConnected;
  }

  // check backend service
  _backendService() async {
    try {
      final resp =
          await ApiBaseHelper2().get(Constants().mainServerAddress + '/health');
      isConnected = true;
    } on FetchDataException {
      await Future.delayed(const Duration(seconds: 3));
      isConnected = false;
    }
  }
}
