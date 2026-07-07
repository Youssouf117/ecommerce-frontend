class CategoryModel {

  final int id;

  final String name;

  final String description;

  final String icon;

  const CategoryModel({

    required this.id,

    required this.name,

    required this.description,

    required this.icon
  });

  factory CategoryModel.fromJson(
      Map<String, dynamic> json) {

    return CategoryModel(

      id: json['id'],

      name: json['name'],

      description: json['description'],

      icon: json['icon']
    );
  }
}