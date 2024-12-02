import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  final String fullName;
  final String email;
  final DateTime createdAt;

  Users({
    required this.fullName,
    required this.email,
    required this.createdAt,
  });

  // Convert data into map for Firebase
  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'email': email,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }

  // Convert Firebase data into Users object
  factory Users.fromMap(Map<String, dynamic> map) {
    return Users(
      fullName: map['fullName'] as String,
      email: map['email'] as String,
      createdAt: (map['createdAt'] as Timestamp).toDate(),
    );
  }
}
