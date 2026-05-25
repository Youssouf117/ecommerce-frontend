import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget{
  final TextEditingController controller;

  final String hintText;

  final String? Function(String?)? validator;

  const PasswordField({
    super.key,
    required this.controller,
    required this.hintText,
    this.validator
});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}



class _PasswordFieldState extends State<PasswordField>{
  bool isObscure=true;

  @override
  Widget build(BuildContext context){
    return TextFormField(
      validator:widget.validator,
      controller: widget.controller,
      obscureText: isObscure,
      decoration: InputDecoration(
        hintText: widget.hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        suffixIcon: IconButton(
          icon: Icon(
            isObscure
              ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed:() {
            setState(() {
              isObscure=!isObscure;
            });
          },
        )
      ),
    );
  }
}