import 'package:ecommerce_mobile/core/widgets/custom_button.dart';
import 'package:ecommerce_mobile/core/widgets/custom_textfield.dart';
import 'package:ecommerce_mobile/features/auth/widgets/password_field.dart';
import 'package:ecommerce_mobile/routes/app_routes.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget{
  const RegisterScreen({super.key});

  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>{

  final _formKey =GlobalKey<FormState>();

  final TextEditingController firstNameController=TextEditingController();

  final TextEditingController lastNameController=TextEditingController();

  final TextEditingController emailController=TextEditingController();

  final TextEditingController phoneController=TextEditingController();

  final TextEditingController passwordController=TextEditingController();

  final TextEditingController confirmPasswordController=TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40,),

                    //Text
                    Text(
                      "Inscription",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 10,),

                    //Text
                    Text("Creez votre compte"),

                    SizedBox(height: 40,),

                    //Champ prenom
                    CustomTextField(
                      hintText: "Prenom",
                      controller: firstNameController,
                      validator: (value) {
                        if(value==null || value.isEmpty){
                          return "Veuillez entrez votre prenom";
                        }

                        return null;
                      },
                    ),

                    SizedBox(height: 20,),

                    // Champ nom
                    CustomTextField(
                      hintText:"Nom",
                      controller: lastNameController,
                      validator: (value) {
                        if(value==null || value.isEmpty){
                          return "Veuillez entrer votre nom";
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 20,),

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

                    //champ Telephone
                    CustomTextField(
                      hintText: "Telephone",
                      keyboardType: TextInputType.phone,
                      controller: phoneController,
                      validator: (value) {
                        if(value==null || value.isEmpty){
                          return "Telephone obligatoire";
                        }

                        if(value.length <8){
                          return "Au minimum 8 caracteres";
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 20,),

                    //Password
                    PasswordField(
                      controller: passwordController,
                      hintText: "Confirmer le mot de passe",
                      validator: (value) {
                        if(value==null || value.isEmpty){
                          return "Mot de passe obligatoire";
                        }
                        if(value.length<6){
                          return "6 caractere minimum";
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 20,),

                    //Champ Confirmer password
                    PasswordField(
                      hintText: "Confirmer mot de passe",
                      controller: confirmPasswordController,
                      validator: (value) {
                        if(value==null || value.isEmpty){
                          return "Confirmer le mot de passe";
                        }
                        if(value !=passwordController.text){
                          return "Mote de passe differents";
                        }

                        return null;
                      },
                    ),

                    SizedBox(height: 30,),

                    //Boutons

                    CustomButton(
                      text: "S'inscrire",
                      onPressed: () {
                        if(_formKey.currentState!.validate()){
                          Navigator.pushReplacementNamed(context, AppRoutes.home);
                        }
                      },
                    ),

                    SizedBox(height: 20,),

                    //Lien de login
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Deja un compte ?  "),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, AppRoutes.login);
                          },
                          child: Text(
                            "Connexion",
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }
}