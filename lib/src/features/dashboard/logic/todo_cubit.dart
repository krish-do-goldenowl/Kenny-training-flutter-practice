import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:myapp/src/network/model/todos.dart';
import 'package:myapp/src/services/todos_service.dart';
import 'package:myapp/src/services/user_prefs.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  final TodoService _todoService;
  TodoCubit(this._todoService) : super(const TodoState());
  final Logger logger = Logger();
  String get uuid => UserPrefs.I.getUserId();

  Future<void> fetchTodos() async {
    emit(state.copyWith(isLoading: true));
    try {
      final todos = await _todoService.fetchUserTodos(uuid);
      emit(state.copyWith(todoList: todos, isLoading: false));
    } catch (e) {
      logger.e('Error fetching todos: $e');
      emit(state.copyWith(isLoading: false));
      return;
    }
  }

  void resetState() {
    emit(const TodoState());
  }

  void addTodo(String content) async {
    try {
      final response =
          await _todoService.addTodoItem(content: content, uuid: uuid);
      if (response) {
        await fetchTodos();
      }
      return;
    } catch (e) {
      logger.e('Error adding todo: $e');
      return;
    }
  }

  void checkTodo({required String docId, required bool isCompleted}) async {
    try {
      final response = await _todoService.checkTodoItem(
          docId: docId, isCompleted: isCompleted);
      if (response) {
        await fetchTodos();
      }
      return;
    } catch (e) {
      logger.e('Error updating todo: $e');
      return;
    }
  }

  void deleteTodo(String docId) async {
    try {
      final response = await _todoService.deleteTodoItem(docId);
      if (response) {
        await fetchTodos();
      }
    } catch (e) {
      logger.e('Error deleting todo: $e');
      return;
    }
  }
}
