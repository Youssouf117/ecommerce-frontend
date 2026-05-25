import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget{
  final TextEditingController controller;

  const PasswordField({
    super.key,
    required this.controller
});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}



class _PasswordFieldState extends State<PasswordField>{
  bool isObscure=true;

  @override
  Widget build(BuildContext context){
    return TextField(
      controller: widget.controller,
      obscureText: isObscure,
      decoration: InputDecoration(
        hintText: "Mot de passe",
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