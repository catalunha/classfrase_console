import 'dart:convert';

class UserB4aModel {
  final String objectId;
  final String email;
  UserB4aModel({
    required this.objectId,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'objectId': objectId,
      'email': email,
    };
  }

  factory UserB4aModel.fromMap(Map<String, dynamic> map) {
    return UserB4aModel(
      objectId: map['objectId'] ?? '',
      email: map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserB4aModel.fromJson(String source) =>
      UserB4aModel.fromMap(json.decode(source));
}
