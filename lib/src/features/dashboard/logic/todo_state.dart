part of 'todo_cubit.dart';

class TodoState {
  final bool isLoading;
  final List<TodoItem> todoList;

  const TodoState({this.todoList = const [], this.isLoading = false});

  TodoState copyWith({bool? isLoading, List<TodoItem>? todoList}) {
    return TodoState(
        isLoading: isLoading ?? this.isLoading,
        todoList: todoList ?? this.todoList);
  }
}
