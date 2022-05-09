import 'package:peerrev/api/baseHelper.dart';
import 'package:peerrev/model/userList.dart';

class UserResp {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<UserListModel> getUserList() async {
    final resp = await _helper.get("http://13.115.178.251/user/all");
    return UserListModel.fromJson(resp);
  }
}
