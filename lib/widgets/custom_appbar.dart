import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.playlist_add_check,
          size: 50,
          color: Colors.white,
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          'ToDayDo',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
