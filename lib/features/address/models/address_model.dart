class AddressModel {

  final int id;

  final String label;

  final String country;

  final String city;

  final String district;

  final String street;

  final double latitude;

  final double longitude;

  final bool isDefault;

  final int userId;

  const AddressModel({
    required this.id,
    required this.label,
    required this.country,
    required this.city,
    required this.district,
    required this.street,
    required this.latitude,
    required this.longitude,
    required this.isDefault,
    required this.userId,
  });

  factory AddressModel.fromJson(
      Map<String, dynamic> json) {

    return AddressModel(
      id: json["id"],
      label: json["label"],
      country: json["country"],
      city: json["city"],
      district: json["district"],
      street: json["street"],
      latitude: json["latitude"].toDouble(),
      longitude: json["longitude"].toDouble(),
      isDefault: json["isDefault"],
      userId: json["userId"],
    );
  }
}