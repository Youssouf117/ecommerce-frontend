import 'package:ecommerce_mobile/features/shop/providers/shop_provider.dart';
import 'package:ecommerce_mobile/features/shopkeeper/widgets/shop_card.dart';
import 'package:ecommerce_mobile/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopkeeperShopsScreen extends StatefulWidget {
  const ShopkeeperShopsScreen({super.key});

  @override
  State<ShopkeeperShopsScreen> createState() =>
      _SellerShopsScreenState();
}

class _SellerShopsScreenState
    extends State<ShopkeeperShopsScreen> {

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<ShopProvider>().loadShops();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mes boutiques"),
      ),

      body: Consumer<ShopProvider>(
        builder: (context, provider, child) {

          if (provider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (provider.errorMessage != null) {
            return Center(
              child: Text(provider.errorMessage!),
            );
          }

          if (provider.shops.isEmpty) {
            return const Center(
              child: Text(
                "Aucune boutique trouvée",
              ),
            );
          }

          return ListView.builder(
            itemCount: provider.shops.length,
            itemBuilder: (context, index) {

              final shop = provider.shops[index];

              return ShopCard(
                shop: shop,
                onEdit: () {},
                onDelete: () {},
              );
            },
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {

          await Navigator.pushNamed(
            context,
            AppRoutes.createShop,
          );

          if (!mounted) return;

          context.read<ShopProvider>().loadShops();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}