import 'package:ecommerce_mobile/features/shop/models/request/create_shop_request.dart';
import 'package:ecommerce_mobile/features/shop/models/request/update_shop_request.dart';

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


    Future<ShopModel> getShopById(int shopId) async {
        try{
            final response=await apiClient.dio.get("shops/$shopId");
            return ShopModel.fromJson(response.data);

        } catch(e){
            throw Exception("Erreur lors du chargement de la boutique");
        }
    }

    Future<ShopModel> createShop(CreateShopRequest request) async {
        try{
            final response=await apiClient.dio.post(
                "shops",
                data: request.toJson()
            );
            return ShopModel.fromJson(response.data);

        } catch(e){
            throw Exception("Erreur lors de la creation de la boutique");
        }
    }



    Future<ShopModel> updateShop(int shopId,UpdateShopRequest request) async {
        try{
            final response=await apiClient.dio.put(
                "shops",
                data: request.toJson()
            );
            return ShopModel.fromJson(response.data);

        } catch(e){
            throw Exception("Erreur lors de la modification de la boutique");
        }
    }

    Future<void> deleteShop(int shopId) async {
        try{
            await apiClient.dio.delete(
                "shops/$shopId",
            );
        } catch(e){
            throw Exception("Erreur lors de la suppression de la boutique");
        }
    }
}