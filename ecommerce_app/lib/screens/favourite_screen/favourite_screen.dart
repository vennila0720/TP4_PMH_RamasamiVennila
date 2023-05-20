import 'package:ecommerce_app/provider/app_provider.dart';

import 'package:ecommerce_app/screens/favourite_screen/widgets/single_favourite_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(
      context,
    );
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "My Favourites",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: appProvider.getFavouriteProductList.isEmpty
            ? const Center(
                child: Text("Favourites Empty"),
              )
            : ListView.builder(
                itemCount: appProvider.getFavouriteProductList.length,
                padding: const EdgeInsets.all(12),
                itemBuilder: (ctx, Index) {
                  return SingleFavouriteItem(
                    singleProduct: appProvider.getFavouriteProductList[Index],
                  );
                },
              ));
  }
}
