import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget{
  final String title;

  final IconData icon;

  final VoidCallback onTap;

  const CategoryCard({
    super.key,
    required this.onTap,
    required this.icon,
    required this.title
});
  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        margin: EdgeInsets.only(
          right: 15,
        ),
        padding: EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 10
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Icon
            Icon(
              icon,
              size: 35,
              color: Colors.red,
            ),

            SizedBox(height: 10,),

            //Title
            Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600
              ),
            ),
          ],
        ),
      ),
    );
  }

}