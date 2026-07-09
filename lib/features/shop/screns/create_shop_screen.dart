import 'package:ecommerce_mobile/features/shop/models/request/create_shop_request.dart';
import 'package:ecommerce_mobile/features/shop/providers/shop_provider.dart';
import 'package:ecommerce_mobile/features/shop/widgets/shop_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateShopScreen extends StatefulWidget{
  const CreateShopScreen({super.key});
  @override
  State<CreateShopScreen> createState() => _CreateShopScreenState();
}

class _CreateShopScreenState extends State<CreateShopScreen>{
  final _formKey=GlobalKey<FormState>();
  final _nameController=TextEditingController();
  final _descriptionController=TextEditingController();
  String? _logo;


  @override
  void dispose(){
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }


  Future<void> createShop() async {
    print("Hello");
    if(!_formKey.currentState!.validate()) return;
    final request= CreateShopRequest(name: _nameController.text.trim(), description: _descriptionController.text.trim(), logo: _logo ?? "");
    await context.read<ShopProvider>().createShop(request);
    if(!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Boutique creer avec succes")));
    Navigator.pop(context);
  }

  void chooseLogo() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Le choix du logo sera ajouté bientôt."),
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Creer une boutique"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ShopForm(
          formKey: _formKey,
          nameController: _nameController,
          descriptionController: _descriptionController,
          logo: _logo,
          onChooseLogo: chooseLogo,
          onSubmit: createShop,
        ),
      ),
    );
  }
}