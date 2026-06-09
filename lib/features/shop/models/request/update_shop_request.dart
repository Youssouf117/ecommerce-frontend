class UpdateShopRequest{
  final String name;
  final String description;
  final String logo;
  final int addressId;

  const UpdateShopRequest({
      required this.name,
      required this.description,
      required this.logo,
      required this.addressId
  }
      );

  Map<String,dynamic> toJson(){
    return {
      "name":name,
      "description":description,
      "logo":logo,
      "addressId":addressId
    };
  }
}