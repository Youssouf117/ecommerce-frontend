class CreateProductRequest{
  final String name;
  final String description;
  final double price;
  final int categoryId;
  final int shopId;
  final int quantity;
  final int minimumQuantity;

  const CreateProductRequest({
    required this.name,
    required this.description,
    required this.price,
    required this.categoryId,
    required this.shopId,
    required this.quantity,
    required this.minimumQuantity
});

  Map<String,dynamic> toJson(){
    return {
      "name":name,
      "description":description,
      "price":price,
      "categoryId":categoryId,
      "shopId":shopId,
      "quantity":quantity,
      "minimumQuantity":minimumQuantity
    };
  }
}