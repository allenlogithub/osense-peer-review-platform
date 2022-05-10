import 'package:flutter/material.dart';

import 'package:peerrev/model/userList.dart';
import 'package:peerrev/api/userResp.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<UserListModel> data;

  @override
  void initState() {
    super.initState();
    data = UserResp().getUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: FutureBuilder<UserListModel>(
        future: data,
        builder: (ctx, snapshot) {
          List<dynamic> users = snapshot.data?.userList ?? [];
          if (users.isEmpty) {
            return Column();
          }
          return ListView.builder(
              itemCount: users.length,
              itemBuilder: (ctx, idx) {
                return Text(users[idx].name);
              });
        },
      ),
    );
  }
}
