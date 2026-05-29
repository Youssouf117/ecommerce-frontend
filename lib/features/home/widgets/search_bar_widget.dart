import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget{
  final TextEditingController controller;

  final VoidCallback onSearch;

  const SearchBarWidget({
    super.key,
    required this.controller,
    required this.onSearch
});
  @override
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 3)
          )
        ]
      ),
      child: Row(
        children: [
          //Search Icon
          Icon(
            Icons.search
          ),

          SizedBox(width: 10,),

          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Rechercher ...",
                border: InputBorder.none
              ),
            ),
          ),
          
          //Filter Bouton
          IconButton(
            onPressed: onSearch,
            icon: Icon(Icons.tune),
          )
        ],
      ),
    );
  }
}