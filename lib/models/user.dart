// Inside user.dart

class Users {
  final String? id;
  final String username;
  final String passwordHash;

  Users({this.id, required this.username, required this.passwordHash});

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': passwordHash,
    };
  }

  factory Users.fromMap(Map<String, dynamic> map) {
    return Users(
      id: map['id'],
      username: map['username'],
      passwordHash: map['passwordHash'],
    );
  }
}
