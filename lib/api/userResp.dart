import 'package:peerrev/api/baseHelper.dart';
import 'package:peerrev/model/userList.dart';
import 'package:peerrev/env/envConfig.dart';

class UserResp {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<UserListModel> getUserList() async {
    final resp = await _helper.get(Constants.mainServerAddress + "/user/all");
    return UserListModel.fromJson(resp);
  }
}
