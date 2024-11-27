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

  Future<bool> addTodoItem(
      {required String content, required String uuid}) async {
    if (content.isEmpty || uuid.isEmpty) {
      log.e('Empty task or UUID');
      return false;
    }
    try {
      await _firestore
          .collection(AppConstants.firestoreCollections.todoCollection)
          .add(TodoItem(
                  content: content,
                  isCompleted: false,
                  uuid: uuid,
                  createdAt: DateTime.now())
              .toMap());
      return true;
    } catch (e) {
      log.e('Error adding todo item: $e');
      return false;
    }
  }

  Future<bool> checkTodoItem(
      {required String docId, required bool isCompleted}) async {
    try {
      await _firestore
          .collection(AppConstants.firestoreCollections.todoCollection)
          .doc(docId)
          .update({'isCompleted': isCompleted});
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
          .delete();
      return true;
    } catch (e) {
      log.e('Error deleting todo item: $e');
      return false;
    }
  }
}
