import 'package:ecommerce_mobile/features/product/requests/product_status.dart';

class ProductModel {
    final int id;

    final String name;

    final String description;

    final double price;

    final ProductStatus status;

    final String categoryName;

    final String shopName;

    const ProductModel({
        required this.id,
        required this.name,
        required this.description,
        required this.price,
        required this.status,
        required this.categoryName,
        required this.shopName
    });

    factory ProductModel.fromJson(Map<String,dynamic> json){
        return ProductModel(
            id:json["id"],
            name:json["name"],
            description: json["description"],
            price: json["price"].toDouble(),
            status: productStatusFromString(json["status"]),
            categoryName: json["categoryName"],
            shopName: json["shopName"],
        );
    }
}