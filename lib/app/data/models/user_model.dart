class UserModel {
  UserModel({
     this.loginType,
      this.uid, 
      this.firstName, 
      this.lastName, 
      this.email,
      this.photoUrl});

  UserModel.fromJson(dynamic json) {
    loginType = json['loginType'];
    uid = json['uid'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
  }
  String? loginType;
  String? uid;
  String? firstName;
  String? lastName;
  String? email;
  String? photoUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['loginType'] = loginType;
    map['uid'] = uid;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['email'] = email;
    map['photoUrl'] = photoUrl;
    return map;
  }

}