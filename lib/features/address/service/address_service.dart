import 'package:ecommerce_mobile/features/address/request/create_address_request.dart';
import 'package:ecommerce_mobile/features/address/request/update_address_request.dart';

import '../../../core/network/api_client.dart';
import '../models/address_model.dart';


class AddressService {
  final ApiClient apiClient = ApiClient();

  // Récupérer toutes les adresses
  Future<List<AddressModel>> getAddresses() async {
    try {
      final response = await apiClient.dio.get(
        "addresses",
      );

      final List<dynamic> data = response.data;

      return data
          .map(
            (address) =>
            AddressModel.fromJson(address),
      )
          .toList();
    } catch (e) {
      throw Exception(
        "Erreur lors du chargement des adresses",
      );
    }
  }


  Future<AddressModel> createAddress(CreateAddressRequest request) async {
    try {
      final response = await apiClient.dio.post(
        "addresses",
        data: request.toJson()
      );

      return AddressModel.fromJson(response.data);
    } catch (e) {
      throw Exception(
        "Erreur lors de la creation d'adresses",
      );
    }
  }

  Future<AddressModel> getAddressById(int addressId) async {
    try {
      final response = await apiClient.dio.get(
          "addresses/$addressId",
      );

      return AddressModel.fromJson(response.data);
    } catch (e) {
      throw Exception(
        "Erreur lors du chargement d'adresse",
      );
    }
  }

  Future<AddressModel> updateAddress(int addressId,UpdateAddressRequest request) async {
    try {
      final response = await apiClient.dio.put(
          "addresses/$addressId",
          data: request.toJson()
      );

      return AddressModel.fromJson(response.data);
    } catch (e) {
      throw Exception(
        "Erreur lors de la modification de l'adresses",
      );
    }
  }


  Future<void> deleteAddress(int addressId) async {
    try {
      await apiClient.dio.delete(
        "addresses/$addressId",
      );
    } catch (e) {
      throw Exception(
        "Erreur lors de la suppression de l'adresse",
      );
    }
  }


  Future<List<AddressModel>>
  getAddressesByUserId(int userId) async {

    try {

      final response =
      await apiClient.dio.get(
        "addresses/user/$userId",
      );

      final List<dynamic> data =
          response.data;

      return data
          .map(
            (address) =>
            AddressModel.fromJson(address),
      )
          .toList();

    } catch (e) {

      throw Exception(
        "Erreur lors du chargement des adresses",
      );
    }
  }


}