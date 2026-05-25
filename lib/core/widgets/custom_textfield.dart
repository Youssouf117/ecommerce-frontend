import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget{

  final String hintText;

  final TextEditingController controller;
  final TextInputType keybordType;
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.keybordType=TextInputType.text,
});
  @override
  Widget build(BuildContext context){
    return TextField(
      controller: controller,
      keyboardType: keybordType,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        )
      ),
    );
  }

}