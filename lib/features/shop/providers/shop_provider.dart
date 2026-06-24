import 'package:flutter/material.dart';

import '../models/shop_model.dart';
import '../service/shop_service.dart';

class ShopProvider extends ChangeNotifier {

  final ShopService shopService =
  ShopService();

  List<ShopModel> _shops = [];

  ShopModel? _selectedShop;

  bool _isLoading = false;

  String? _errorMessage;

  List<ShopModel> get shops => _shops;

  ShopModel? get selectedShop =>
      _selectedShop;

  bool get isLoading =>
      _isLoading;

  String? get errorMessage =>
      _errorMessage;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> loadShops() async {

    try {

      _setLoading(true);

      _errorMessage = null;

      _shops =
      await shopService.getShops();

      notifyListeners();

    } catch (e) {

      _errorMessage =
          e.toString();

      notifyListeners();

    } finally {

      _setLoading(false);
    }
  }

  Future<void> loadShopById(
      int shopId) async {

    try {

      _setLoading(true);

      _errorMessage = null;

      _selectedShop =
      await shopService
          .getShopById(shopId);

      notifyListeners();

    } catch (e) {

      _errorMessage =
          e.toString();

      notifyListeners();

    } finally {

      _setLoading(false);
    }
  }

  void clearError() {

    _errorMessage = null;

    notifyListeners();
  }
}