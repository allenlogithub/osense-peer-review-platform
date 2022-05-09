class UserListModel {
  int code = 0;
  List<UserModel> userList = [];
  int userCount = 0;

  UserListModel(this.code, this.userList);

  UserListModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null && code == 1) {
      json['data'].forEach((v) {
        userList.add(UserModel.fromJson(v));
      });
    }
    userCount = userList.length;
  }

  String? error;

  UserListModel.withError(String errorMessage) {
    error = errorMessage;
  }
}

class UserModel {
  late bool activate;
  late String department;
  late String email;
  late int id;
  late String name;
  late List<int> role;

  UserModel(this.activate, this.department, this.email, this.id, this.name,
      this.role);

  UserModel.fromJson(Map<String, dynamic> json) {
    activate = json['activate'] ?? '';
    department = json['department'] ?? '';
    email = json['email'] ?? '';
    id = json['id'] ?? '';
    name = json['name'] ?? '';
    role = json['role'].cast<int>() ?? List<int>;
  }
}
