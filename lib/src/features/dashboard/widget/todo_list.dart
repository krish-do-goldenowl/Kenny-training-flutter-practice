import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myapp/gen/assets.gen.dart';
import 'package:myapp/src/features/dashboard/logic/todo_cubit.dart';
import 'package:myapp/src/features/dashboard/widget/custom_checkbox.dart';
import 'package:myapp/src/network/model/todos.dart';
import 'package:myapp/src/theme/colors.dart';
import 'package:myapp/src/theme/styles.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  TodoListState createState() => TodoListState();
}

class TodoListState extends State<TodoList> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    context.read<TodoCubit>().fetchTodos();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _showAddTodoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Add New Todo',
            style: AppStyles.semiBoldText,
          ),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: 'Enter your task',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: AppStyles.normalText
                    .copyWith(color: AppColors.textHighLight),
              ),
            ),
            TextButton(
              onPressed: () {
                final content = controller.text.trim();
                if (content.isNotEmpty) {
                  context.read<TodoCubit>().addTodo(content);
                  controller.clear();
                }
                Navigator.of(context).pop();
              },
              child: Text(
                'Add',
                style: AppStyles.normalText
                    .copyWith(color: AppColors.textHighLight),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showEditTodoDialog(BuildContext context, TodoItem todo) {
    controller.text = todo.content;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Edit Todo',
            style: AppStyles.semiBoldText,
          ),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: 'Enter your task',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: AppStyles.normalText
                    .copyWith(color: AppColors.textHighLight),
              ),
            ),
            TextButton(
              onPressed: () {
                final content = controller.text.trim();
                if (content.isNotEmpty) {
                  context
                      .read<TodoCubit>()
                      .updateTodoItem(todo.docId!, content);
                  controller.clear();
                }
                Navigator.of(context).pop();
              },
              child: Text(
                'Save',
                style: AppStyles.normalText
                    .copyWith(color: AppColors.textHighLight),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showConfirmDeleteDialog(BuildContext context, String docId) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Delete Todo',
            style: AppStyles.semiBoldText,
          ),
          content: const Text(
            'Are you sure you want to delete this task?',
            style: AppStyles.normalText,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: AppStyles.normalText
                    .copyWith(color: AppColors.textHighLight),
              ),
            ),
            TextButton(
              onPressed: () {
                context.read<TodoCubit>().deleteTodo(docId);
                Navigator.of(context).pop();
              },
              child: Text(
                'Delete',
                style: AppStyles.normalText
                    .copyWith(color: AppColors.textHighLight),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoCubit, TodoState>(
      buildWhen: (previous, current) => previous.todoList != current.todoList,
      builder: (BuildContext context, TodoState state) {
        final todoCubit = context.read<TodoCubit>();
        return Container(
          height: 280,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 10,
              ),
            ],
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Daily Task',
                        style: AppStyles.semiBoldText
                            .copyWith(fontSize: 12, color: AppColors.black4),
                      ),
                      GestureDetector(
                        onTap: () => _showAddTodoDialog(context),
                        child: SvgPicture.asset(Assets.svgs.addIcon),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Expanded(
                  child: Scrollbar(
                    thickness: 3,
                    thumbVisibility: true,
                    child: ReorderableListView(
                      onReorder: (int oldIndex, int newIndex) {
                        todoCubit.reorderTodos(oldIndex, newIndex);
                      },
                      children: [
                        for (int index = 0;
                            index < state.todoList.length;
                            index++)
                          ReorderableDragStartListener(
                            key: ValueKey(state.todoList[index].docId),
                            index: index,
                            child: GestureDetector(
                              onDoubleTap: () => _showEditTodoDialog(
                                  context, state.todoList[index]),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CustomCheckbox(
                                      onTap: () => todoCubit.checkTodo(
                                          docId: state.todoList[index].docId!,
                                          isCompleted: !state
                                              .todoList[index].isCompleted),
                                      value: state.todoList[index].isCompleted,
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Text(
                                        state.todoList[index].content,
                                        style: AppStyles.semiBoldText.copyWith(
                                            fontSize: 12,
                                            color: AppColors.black4,
                                            decoration: state
                                                    .todoList[index].isCompleted
                                                ? TextDecoration.lineThrough
                                                : TextDecoration.none),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => _showConfirmDeleteDialog(
                                          context,
                                          state.todoList[index].docId!),
                                      child: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                  ],
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
