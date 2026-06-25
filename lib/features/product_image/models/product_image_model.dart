class ProductImageModel{
  final int id;

  final String imageUrl;

  final bool isMain;

  final int productId;

  const ProductImageModel({
    required this.id,
    required this.imageUrl,
    required this.isMain,
    required this.productId
});

  factory ProductImageModel.fromJson(Map<String,dynamic> json){
    return ProductImageModel(id: json["id"], imageUrl: json["imageUrl"], isMain: json["isMain"], productId: json["productId"]);
  }
}