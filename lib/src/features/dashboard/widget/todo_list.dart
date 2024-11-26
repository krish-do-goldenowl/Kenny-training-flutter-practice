import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myapp/gen/assets.gen.dart';
import 'package:myapp/src/features/dashboard/widget/custom_checkbox.dart';
import 'package:myapp/src/theme/colors.dart';
import 'package:myapp/src/theme/styles.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => TodoListState();
}

class TodoListState extends State<TodoList> {
  final List<String> todoList = List.generate(30, (index) => 'Item $index');

  void deleteItem(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  void checkItem() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
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
                    onTap: () {},
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
                trackVisibility: true,
                child: ListView.builder(
                  itemCount: todoList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomCheckbox(
                            onTap: checkItem,
                            value: true,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              todoList[index],
                              style: AppStyles.semiBoldText.copyWith(
                                  fontSize: 12, color: AppColors.black4),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => deleteItem(index),
                            child: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                          const SizedBox(width: 10),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
