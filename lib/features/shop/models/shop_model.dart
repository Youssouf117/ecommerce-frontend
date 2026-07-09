class ShopModel{
    final int id;

    final String name;

    final String description;

    final String logo;

    final String status;

    const ShopModel({
        required this.id,
        required this.name,
        required this.description,
        required this.logo,
        required this.status,
    });

    factory ShopModel.fromJson(Map<String,dynamic> json){
        return ShopModel(
            id: json["id"],
            name: json["name"],
            description: json["description"],
            logo: json["logo"],
            status: json["status"],
        );
    }
}