import 'package:flutter/material.dart';


class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, this.onSaved, this.controller, });
final  TextEditingController? controller;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
        onSaved: onSaved,
        validator: (value) {
          if (value == '') {
            return 'رجاء ادخال مهمه';
          } else {
            return null;
          }
        },
        textAlign: TextAlign.center,
        decoration: const InputDecoration(
          hintText: 'add task',
          hintStyle: TextStyle(color: Colors.grey),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xff2DA98D))),
        ));
  }
}
