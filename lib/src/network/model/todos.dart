import 'package:cloud_firestore/cloud_firestore.dart';

class TodoItem {
  final String content;
  final bool isCompleted;
  final String uuid;
  final DateTime createdAt;
  final String? docId;

  const TodoItem(
      {required this.content,
      required this.isCompleted,
      required this.createdAt,
      required this.uuid,
      this.docId});

  // Convert data into map for Firebase
  Map<String, dynamic> toMap() {
    return {
      'content': content,
      'isCompleted': isCompleted,
      'createdAt': Timestamp.fromDate(createdAt),
      'uuid': uuid,
    };
  }

  // Convert Firebase data into Users object
  factory TodoItem.fromMap(Map<String, dynamic> map, String docId) {
    return TodoItem(
        content: map['content'] as String,
        isCompleted: map['isCompleted'] as bool,
        createdAt: (map['createdAt'] as Timestamp).toDate(),
        uuid: map['uuid'] as String,
        docId: docId);
  }
}
