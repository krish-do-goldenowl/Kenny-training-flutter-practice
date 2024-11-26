class Users {
  final String fullName;
  final String email;
  final DateTime createdAt;

  Users({
    required this.fullName,
    required this.email,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'email': email,
      'createdAt': createdAt,
    };
  }
}
