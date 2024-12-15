import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';
import 'package:myapp/src/config/constants/constants.dart';
import 'package:myapp/src/network/model/todos.dart';

class TodoService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final Logger log = Logger();

  Future<List<TodoItem>> fetchUserTodos(String uuid) async {
    try {
      final todos = await _firestore
          .collection(AppConstants.firestoreCollections.todoCollection)
          .where('uuid', isEqualTo: uuid)
          .where('isDeleted', isEqualTo: false)
          .orderBy('createdAt', descending: true)
          .get();
      return todos.docs
          .map((doc) => TodoItem.fromMap(doc.data(), doc.id))
          .toList();
    } catch (e) {
      log.e('Error fetching user todos: $e');
      return [];
    }
  }

  Future<TodoItem?> addTodoItem({
    required String content,
    required String uuid,
  }) async {
    if (content.isEmpty || uuid.isEmpty) {
      log.e('Empty task or UUID');
      return null;
    }
    try {
      final result = await _firestore
          .collection(AppConstants.firestoreCollections.todoCollection)
          .add(TodoItem(
            content: content,
            isCompleted: false,
            isDeleted: false,
            uuid: uuid,
          ).toMap());
      final newTodo = TodoItem(
        content: content,
        isCompleted: false,
        isDeleted: false,
        uuid: uuid,
        docId: result.id,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      return newTodo;
    } catch (e) {
      log.e('Error adding todo item: $e');
      return null;
    }
  }

  Future<bool> updateTodoItem({
    required String docId,
    required String content,
  }) async {
    try {
      await _firestore
          .collection(AppConstants.firestoreCollections.todoCollection)
          .doc(docId)
          .update({'content': content, 'updatedAt': DateTime.now()});
      return true;
    } catch (e) {
      log.e('Error updating todo item: $e');
      return false;
    }
  }

  Future<bool> checkTodoItem(
      {required String docId, required bool isCompleted}) async {
    try {
      await _firestore
          .collection(AppConstants.firestoreCollections.todoCollection)
          .doc(docId)
          .update({'isCompleted': isCompleted, 'updatedAt': DateTime.now()});
      return true;
    } catch (e) {
      log.e('Error updating todo item: $e');
      return false;
    }
  }

  Future<bool> deleteTodoItem(String docId) async {
    try {
      await _firestore
          .collection(AppConstants.firestoreCollections.todoCollection)
          .doc(docId)
          .update({'isDeleted': true});
      return true;
    } catch (e) {
      log.e('Error deleting todo item: $e');
      return false;
    }
  }
}
