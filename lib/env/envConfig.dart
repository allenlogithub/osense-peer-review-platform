import 'package:peerrev/api/exception.dart';
import 'package:peerrev/api/baseHelper.dart';

class Constants {
  static String mainServerAddress =
      const String.fromEnvironment("MAIN_SERVER_ADDRESS");
  static String googleSignInClientId =
      const String.fromEnvironment("GOOGLE_SIGN_IN_CLIENT_ID");

  static String apiKey = const String.fromEnvironment("API_KEY");
  static String appId = const String.fromEnvironment("API_ID");
  static String messagingSenderId =
      const String.fromEnvironment("MESSAGING_SENDER_ID");
  static String projectId = const String.fromEnvironment("PROJECT_ID");
  static String authDomain = const String.fromEnvironment("AUTH_DOMAIN");
  static String storageBucket = const String.fromEnvironment("STORAGE_BUCKET");
  static String measurementId = const String.fromEnvironment("MEASUREMENT_ID");
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
          await ApiBaseHelper2().get(Constants.mainServerAddress + '/health');
    } on FetchDataException {
      await Future.delayed(const Duration(seconds: 3));
      isConnected = false;
    }
  }
}
