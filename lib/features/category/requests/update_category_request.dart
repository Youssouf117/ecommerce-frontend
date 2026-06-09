class UpdateCategoryRequest{
  final String name;
  final String description;

  const UpdateCategoryRequest({
    required this.name,
    required this.description
});

  Map<String,dynamic> toJson(){
    return {
      "name":name,
      "description":description
    };
  }
}