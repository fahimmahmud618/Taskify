import 'package:taskify/model/todo.dart';

class User {
  String userName;
  String password;
  String pin;

  User({
    required this.userName,
    required this.password,
    required this.pin,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userName: map['userName'] ?? '',
      password: map['password'] ?? '',
      pin: map['pin'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'password': password,
      'pin': pin,
    };
  }
}
