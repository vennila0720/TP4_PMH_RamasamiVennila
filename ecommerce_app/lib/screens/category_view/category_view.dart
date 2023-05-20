import 'package:ecommerce_app/constants/routes.dart';
import 'package:ecommerce_app/firebase_helper/firebase_firestore_helper/firebase_firestore_helper.dart';
import 'package:ecommerce_app/models/category_model/category_model.dart';
import 'package:ecommerce_app/models/product_model/product_model.dart';
import 'package:ecommerce_app/screens/product_details/product_details.dart';
import 'package:flutter/material.dart';

class CategoryView extends StatefulWidget {
  final CategoryModel categoryModel;
  const CategoryView({super.key, required this.categoryModel});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  List<ProductModel> productModelList = [];

  bool isLoading = false;
  void getCategoryList() async {
    setState(() {
      isLoading = true;
    });

    productModelList = await FirebaseFirestoreHelper.instance
        .getCategoryViewProduct(widget.categoryModel.id);

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getCategoryList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isLoading
            ? Center(
                child: Container(
                  height: 100,
                  width: 100,
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: kToolbarHeight * 1),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          const BackButton(),
                          Text(
                            widget.categoryModel.name,
                            style: const TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    productModelList.isEmpty
                        ? Center(
                            child: Text("Best Accessories is empty"),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(
                                top: 12.0, left: 12.0, right: 12.0),
                            child: GridView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemCount: productModelList.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        mainAxisSpacing: 20,
                                        crossAxisSpacing: 20,
                                        childAspectRatio: 0.6,
                                        crossAxisCount: 2),
                                itemBuilder: (ctx, index) {
                                  ProductModel singleProduct =
                                      productModelList[index];
                                  return Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24.0),
                                      color: Color.fromARGB(255, 93, 24, 105)
                                          .withOpacity(0.2),
                                    ),
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        Image.network(
                                          singleProduct.image,
                                          height: 75,
                                          width: 60,
                                        ),
                                        SizedBox(
                                          height: 30.0,
                                        ),
                                        Text(
                                          singleProduct.name,
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "Price: \$${singleProduct.price}",
                                        ),
                                        const SizedBox(
                                          height: 45.0,
                                        ),
                                        SizedBox(
                                          height: 45,
                                          width: 120,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Routes.instance.push(
                                                  widget: ProductDetails(
                                                      singleProduct:
                                                          singleProduct),
                                                  context: context);
                                            },
                                            style: ElevatedButton.styleFrom(
                                                side: const BorderSide(
                                                    color: Color.fromARGB(
                                                        255, 93, 24, 105),
                                                    width: 15.0)),
                                            child: const Text("Buy"),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                    const SizedBox(
                      height: 12.0,
                    ),
                  ],
                ),
              ));
  }
}
