import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget{
  final String name;

  final double price;

  final String imageUrl;

  final VoidCallback onTap;

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.onTap
});

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 170,
        margin: EdgeInsets.only(
          right: 15
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              offset: Offset(0,3)
            )
          ],
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Image
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(15)
              ),
              child: Image.network(
                imageUrl,
                height: 140,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Nom du produit
                  Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  
                  SizedBox(height: 8,),
                  
                  //Price
                  Text(
                    "${price.toStringAsFixed(0)} FCFA",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                    )
                  ),
                  
                  SizedBox(height: 10,),
                  
                  //Bouton panier
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Ajouter"),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}