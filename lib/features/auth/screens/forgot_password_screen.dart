import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget{
  const ForgotPasswordScreen({super.key});

  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: Text("ForgotPassword"),
      ),
    );
  }
}