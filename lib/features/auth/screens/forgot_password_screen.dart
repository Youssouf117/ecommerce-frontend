import 'package:ecommerce_mobile/core/widgets/custom_button.dart';
import 'package:ecommerce_mobile/core/widgets/custom_textfield.dart';
import 'package:ecommerce_mobile/routes/app_routes.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget{
  const ForgotPasswordScreen({super.key});

  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen>{
  final _formKey=GlobalKey<FormState>();

  final TextEditingController emailController=TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40,),

                //Text
                Text(
                  "Mot de passe oublie",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),
                ),

                SizedBox(height: 10,),

                //Text
                Text("Entrez votre email pour reinitialiser votre mot de passe"),

                SizedBox(height: 40,),

                //Email
                CustomTextField(
                  keyboardType: TextInputType.emailAddress,
                  hintText: "Email",
                  controller: emailController,
                  validator: (value) {
                    if(value==null || value.isEmpty){
                      return "Email obligatoire";
                    }
                    if(!value.contains('@')){
                      return "Email invalide";
                    }
                    return null;
                  },
                ),

                SizedBox(height: 30,),

                //Button
                CustomButton(
                  text: "Envoyer",
                  onPressed: () {
                    if(_formKey.currentState!.validate()){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Lien envoye"),
                        )
                      );
                    }
                  },
                ),

                SizedBox(height: 20,),

                // Lien de login
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.login);
                    },
                    child: Text(
                      "Retour a la connexion",
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}