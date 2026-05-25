import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget{
  const RegisterScreen({super.key});

  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
        body: SafeArea(
          child: Text("Register"),
        ),
    );
  }
}