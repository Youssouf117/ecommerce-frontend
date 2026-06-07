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
}