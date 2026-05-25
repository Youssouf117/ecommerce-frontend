import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget{

  final String hintText;

  final TextEditingController controller;

  final TextInputType keyboardType;

  final String? Function(String?)? validator;


  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.validator,
    this.keyboardType=TextInputType.text,
});
  @override
  Widget build(BuildContext context){
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        )
      ),
    );
  }

}