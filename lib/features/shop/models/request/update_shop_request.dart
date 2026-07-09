class UpdateShopRequest{
  final String name;
  final String description;
  final String logo;

  const UpdateShopRequest({
      required this.name,
      required this.description,
      required this.logo
  }
      );

  Map<String,dynamic> toJson(){
    return {
      "name":name,
      "description":description,
      "logo":logo,
    };
  }
}