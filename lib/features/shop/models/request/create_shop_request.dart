class CreateShopRequest{
  final String name;
  final String description;
  final String logo;

  const CreateShopRequest({
    required this.name,
    required this.description,
    required this.logo,
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