class UserModel {
  final String? password;
  final String? email;
  String? uid;

  UserModel({ this.password, this.email,  this.uid});

  set setUid(value) => uid = value;

  Map<String?, dynamic> toJson() =>
      {"email": email, "uid": uid, "password": password};
}
