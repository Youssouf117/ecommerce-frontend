import '../../../core/network/api_client.dart';
import '../models/shop_model.dart';

class ShopService{
    final ApiClient apiClient=ApiClient();

    Future<List<ShopModel>> getShops() async {
        try{
            final response=await apiClient.dio.get("shops");

            final List<dynamic> data= response.data;

            return data.map((shop) => ShopModel.fromJson(shop)).toList();

        } catch(e){
            throw Exception("Erreur lors du chargements des boutiques");
        }
    }
}