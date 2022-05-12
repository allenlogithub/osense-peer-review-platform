import 'package:flutter/material.dart';
import 'package:peerrev/main.dart';

class RefreshPage extends StatelessWidget {
  const RefreshPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Failed to connect to the resources.',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
              child: const Text('Retry'),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => InitializationApp())))
        ],
      ),
    );
  }
}
