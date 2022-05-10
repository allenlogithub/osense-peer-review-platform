// import 'dart:io';

import 'package:peerrev/api/exception.dart';

class Constants {
  String mainServerAddress =
      const String.fromEnvironment("MAIN_SERVER_ADDRESS");
}

class Init {
  static Future initServices() async {
    await _backendService();
  }

  // check backend service
  static _backendService() async {
    // // seem not support by web.......
    // Socket.connect(Constants().mainServerAddress, 80,
    //         timeout: const Duration(seconds: 5))
    //     .then((socket) {
    //   print("Success");
    //   socket.destroy();
    // }).catchError((error) {
    //   print("Exception on Socket " + error.toString());
    //   throw TimeoutException('No Backend connection');
    // });

    print('checking backend service');
    await Future.delayed(const Duration(seconds: 3));
    print('backend service is up');
  }
}

class TimeoutException extends AppException {
  TimeoutException([String message = '']) : super(message, 'Timeout: ');
}
