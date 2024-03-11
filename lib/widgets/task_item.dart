import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class TaskItem extends StatefulWidget {
  const TaskItem({super.key, this.task, this.btnOkOnPress});
  final String? task;
final  void Function()? btnOkOnPress;

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.question,
          title: 'هل انت متاكد من حذف المهمة؟',
          btnCancelOnPress: () {},
          btnOkOnPress:widget.btnOkOnPress,
        ).show();
      },
      child: Card(
        elevation: .4,
        child: ListTile(
          trailing: Checkbox(
            value: isSelected,
            onChanged: (bool? value) {
              setState(() {
                isSelected = value ?? true;
              });
            },
            activeColor: const Color(
              0xff2DA98D,
            ),
          ),
          title: Text(
            widget.task ?? '',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                decoration: isSelected
                    ? TextDecoration.lineThrough
                    : TextDecoration.none),
          ),
        ),
      ),
    );
  }
}
