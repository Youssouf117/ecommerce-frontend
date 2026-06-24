import 'package:ecommerce_mobile/features/product/models/product_model.dart';
import 'package:ecommerce_mobile/features/product/service/product_service.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier{
  ProductService productService=ProductService();
  List<ProductModel> _products=[];
  List<ProductModel> get products => _products;

  bool _isLoading=false;
  bool get isLoading => _isLoading;
  void _setLoading(bool value){
    _isLoading=value;
    notifyListeners();
  }

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  ProductModel? _selectedProduct;
  ProductModel? get selectedProduct => _selectedProduct;


  Future<void> loadProducts() async{
    try{
      _setLoading(true);
      _errorMessage=null;
      _products=await productService.getProducts();
      notifyListeners();
    } catch(e){
      _errorMessage=e.toString();
      notifyListeners();
    } finally{
      _setLoading(false);
    }
  }

  Future<void> loadProductById(int productId) async{
    try{
      _setLoading(true);
      _errorMessage=null;
      _selectedProduct=await productService.getProductById(productId);
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