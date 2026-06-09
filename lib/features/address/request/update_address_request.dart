class UpdateAddressRequest{
  final String label;
  final String country;
  final String city;
  final String district;
  final String street;
  final double latitude;
  final double longitude;
  final bool isDefault;

  const UpdateAddressRequest({
    required this.label,
    required this.country,
    required this.city,
    required this.district,
    required this.street,
    required this.latitude,
    required this.longitude,
    this.isDefault=false,
  });

  Map<String,dynamic> toJson(){
    return {
      "label":label,
      "country":country,
      "city":city,
      "district":district,
      "street":street,
      "latitude":latitude,
      "longitude":longitude,
      "isDefault":isDefault,
    };
  }
}