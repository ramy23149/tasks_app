import 'package:flutter/material.dart';


class CostumBottom extends StatelessWidget {
  const CostumBottom({super.key, this.onTab,  this.isloading = false});

  final void Function()? onTab;

  final bool isloading;
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 40,
        decoration: BoxDecoration(
            color: const Color(0xff2DA98D), borderRadius: BorderRadius.circular(8)),
        child:  Center(
          child: isloading ?   const SizedBox(
            height: 24,
            width: 24,
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          )  :const Text(
            'Add',
            style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
