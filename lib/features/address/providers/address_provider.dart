import 'package:flutter/material.dart';
import '../models/address_model.dart';
import '../service/address_service.dart';

class AddressProvider extends ChangeNotifier {

  final AddressService addressService =
  AddressService();

  List<AddressModel> _addresses = [];

  bool _isLoading = false;

  String? _errorMessage;

  List<AddressModel> get addresses =>
      _addresses;

  bool get isLoading =>
      _isLoading;

  String? get errorMessage =>
      _errorMessage;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> loadAddresses(
      int userId) async {

    try {

      _setLoading(true);

      _errorMessage = null;

      _addresses =
      await addressService
          .getAddressesByUserId(
          userId);

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