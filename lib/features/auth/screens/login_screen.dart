import 'package:ecommerce_mobile/core/widgets/custom_button.dart';
import 'package:ecommerce_mobile/core/widgets/custom_textfield.dart';
import 'package:ecommerce_mobile/features/auth/widgets/password_field.dart';
import 'package:ecommerce_mobile/routes/app_routes.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen>{

  final _formKey=GlobalKey<FormState>();

  final TextEditingController emailController= TextEditingController();

  final TextEditingController passwordController=TextEditingController();


  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child:Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height:40),

                //1 er element de la colonne
                Text(
                  "Connexion",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),
                ),

                SizedBox(height:10),

                //Un autre Text
                Text("Connectez vous a votre compte"),

                SizedBox(height: 40,),

                //Champ email
                CustomTextField(
                  hintText: "Email",
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
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

                SizedBox(height: 20,),

                //Champ password

                PasswordField(
                  controller: passwordController,
                  validator: (value) {
                    if(value==null || value.isEmpty){
                      return "Mot de passe obligatoire";
                    }
                    if(value.length<6){
                      return "6 caracteres minimum";
                    }
                    return null;
                  },
                ),

                SizedBox(height: 10,),

                //Mot de passe oublie
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.forgotPassword);
                    },
                    child: Text("Mot de passe oublie ?"),
                  ),
                ),

                SizedBox(height: 30,),

                //Bouton de connexion

                CustomButton(
                  text: "Connexion",
                  onPressed: () {
                    if(_formKey.currentState!.validate()){
                      Navigator.pushReplacementNamed(context, AppRoutes.home);
                    }
                  },
                ),

                SizedBox(height: 20,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Pas de compte ?"),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.register);
                      },
                      child: Text(
                        "Creer un compte",
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}