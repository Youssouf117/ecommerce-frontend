import 'package:ecommerce_mobile/features/product/requests/create_product_request.dart';
import 'package:ecommerce_mobile/features/product/requests/update_product_request.dart';

import '../../../core/network/api_client.dart';
import '../models/product_model.dart';
class ProductService{
    final ApiClient apiClient=ApiClient();

    Future<List<ProductModel>> getProducts() async{
        try{
            final response= await apiClient.dio.get("products");

            final List<dynamic> data=response.data;

            return data.map((product) => ProductModel.fromJson(product)).toList();

        } catch(e) {
            throw Exception("Erreur lors du changement des produits");
        }
    }

    Future<ProductModel> getProductById(int productId) async{
        try{
            final response=await apiClient.dio.get("products/$productId");

            return ProductModel.fromJson(response.data);
        } catch(e){
            throw Exception("Erreur lors du chargement du produit");
        }
    }


    Future<ProductModel> createProduct(CreateProductRequest request) async{
        try{
            final response=await apiClient.dio.post(
                "products",
                data:request.toJson()
            );

            return ProductModel.fromJson(response.data);
        } catch(e){
            throw Exception("Erreur lors de la creation du produit");
        }
    }


    Future<ProductModel> updateProduct(int productId,UpdateProductRequest request) async{
        try{
            final response=await apiClient.dio.put(
                "products/$productId",
                data: request.toJson()
            );

            return ProductModel.fromJson(response.data);
        } catch(e){
            throw Exception("Erreur lors de la modification du produit ");
        }
    }


    Future<void> deleteProduct(int productId) async{
        try{
            await apiClient.dio.delete("products/$productId");
        } catch(e){
            throw Exception("Erreur lors de la suppression du produit");
        }
    }
}