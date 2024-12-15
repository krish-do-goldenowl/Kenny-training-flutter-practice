import 'package:cloud_firestore/cloud_firestore.dart';

class TodoItem {
  final String content;
  final bool isCompleted;
  final String uuid;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? docId;
  final bool isDeleted;

  const TodoItem(
      {required this.content,
      required this.isCompleted,
      this.createdAt,
      this.updatedAt,
      required this.uuid,
      required this.isDeleted,
      this.docId});

  // Convert data into map for Firebase
  Map<String, dynamic> toMap() {
    return {
      'content': content,
      'isCompleted': isCompleted,
      'isDeleted': isDeleted,
      'createdAt': createdAt != null
          ? Timestamp.fromDate(createdAt!)
          : FieldValue.serverTimestamp(),
      'updatedAt': updatedAt != null
          ? Timestamp.fromDate(updatedAt!)
          : FieldValue.serverTimestamp(),
      'uuid': uuid,
    };
  }

  // Convert Firebase data into Users object
  factory TodoItem.fromMap(Map<String, dynamic> map, String docId) {
    return TodoItem(
        content: map['content'] as String,
        isCompleted: map['isCompleted'] as bool,
        isDeleted: map['isDeleted'] as bool,
        createdAt: (map['createdAt'] as Timestamp).toDate(),
        updatedAt: (map['updatedAt'] as Timestamp).toDate(),
        uuid: map['uuid'] as String,
        docId: docId);
  }

  TodoItem copyWith({
    String? content,
    bool? isCompleted,
    String? uuid,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? docId,
    bool? isDeleted,
  }) {
    return TodoItem(
      content: content ?? this.content,
      isCompleted: isCompleted ?? this.isCompleted,
      uuid: uuid ?? this.uuid,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      docId: docId ?? this.docId,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }
}
