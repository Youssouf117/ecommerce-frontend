import 'package:ecommerce_mobile/features/category/models/category_model.dart';
import 'package:ecommerce_mobile/features/category/service/category_service.dart';
import 'package:flutter/material.dart';

class CategoryProvider extends ChangeNotifier{
  final CategoryService categoryService=CategoryService();

  List<CategoryModel> _categories=[];
  bool _isLoading=false;
  String? _errorMessage;

  List<CategoryModel> get categories => _categories;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  void _setLoading(bool value){
    _isLoading=value;
    notifyListeners();
  }

  Future<void> loadCategories() async{
    try{
      _setLoading(true);
      _errorMessage=null;
      _categories=await categoryService.getCategories();
      notifyListeners();
    } catch(e){
      _errorMessage=e.toString();
      notifyListeners();
    } finally{
      _setLoading(false);
    }
  }

  void clearError(){
    _errorMessage=null;
    notifyListeners();
  }
}