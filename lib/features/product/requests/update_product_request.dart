import 'package:ecommerce_mobile/features/product/requests/product_status.dart';

class UpdateProductRequest{
  final String name;
  final String description;
  final double price;
  final int categoryId;
  final ProductStatus status;

  const UpdateProductRequest({
    required this.name,
    required this.description,
    required this.price,
    required this.categoryId,
    required this.status,
});

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "description": description,
      "price": price,
      "categoryId": categoryId,
      "status": status.name,
    };
  }
}