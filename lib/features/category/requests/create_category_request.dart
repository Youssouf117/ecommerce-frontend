class CreateCategoryRequest{
  final String name;
  final String description;

  const CreateCategoryRequest({
    required this.name,
    required this.description
});

  Map<String,dynamic> toJson(){
    return {
      "name": name,
      "description": description
    };
  }
}