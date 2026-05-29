import 'package:ecommerce_mobile/core/services/storage_service.dart';
import 'package:ecommerce_mobile/features/home/widgets/category_card.dart';
import 'package:ecommerce_mobile/features/home/widgets/product_card.dart';
import 'package:ecommerce_mobile/features/home/widgets/search_bar_widget.dart';
import 'package:ecommerce_mobile/routes/app_routes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

   State<HomeScreen> createState() => _HomeScreenState();

}


class _HomeScreenState extends State<HomeScreen>{
  final TextEditingController searchController=TextEditingController();
  final StorageService storageService=StorageService();

  Future<void> logoutUser() async{
    await storageService.removeToken();

    Navigator.pushNamedAndRemoveUntil(context,AppRoutes.login, (route) => false);

  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Maison Kandara"),
        actions: [
          IconButton(onPressed: logoutUser, icon: Icon(Icons.logout))
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Search
            SearchBarWidget(controller: searchController, onSearch: () {}),

            SizedBox(height: 25,),

            //Categories
            Text(
              "Categories",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),

            SizedBox(height: 15,),

            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CategoryCard(
                    title: "Electronique",
                    icon: Icons.phone_android,
                    onTap: () {},
                  ),
                  CategoryCard(
                    title: "Mode",
                    icon: Icons.shopping_bag,
                    onTap: () {},
                  ),
                  CategoryCard(
                    title: "Maison",
                    icon: Icons.chair,
                    onTap: () {},
                  ),
                ],
              ),
            ),

            SizedBox(height: 25,),

            const Text(

              "Produits populaires",

              style: TextStyle(

                fontSize: 20,

                fontWeight:
                FontWeight.bold,
              ),
            ),

            SizedBox(height: 15,),

            SizedBox(
              height: 280,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ProductCard(
                    name: "Iphone 15",
                    imageUrl: "",
                    onTap: () {},
                    price: 85000,
                  ),
                  ProductCard(
                    name: "Nike",
                    imageUrl: "",
                    onTap: () {},
                    price: 30000,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}