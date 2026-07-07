class UpdateCategoryRequest{
  final String name;
  final String description;
  final String icon;

  const UpdateCategoryRequest({
    required this.name,
    required this.description,
    required this.icon
});

  Map<String,dynamic> toJson(){
    return {
      "name":name,
      "description":description,
      "icon":icon
    };
  }
}