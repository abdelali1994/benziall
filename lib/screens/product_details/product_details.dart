import 'package:ecommerce_with_admin_panel/constants/constants.dart';
import 'package:ecommerce_with_admin_panel/constants/routes.dart';
import 'package:ecommerce_with_admin_panel/models/product_model/product_model.dart';
import 'package:ecommerce_with_admin_panel/provider/app_provider.dart';
import 'package:ecommerce_with_admin_panel/screens/cart_screen/cart_screen.dart';
import 'package:ecommerce_with_admin_panel/screens/check_out/check_out.dart';
import 'package:ecommerce_with_admin_panel/screens/favourite_screen/favourite_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  final ProductModel singleProduct;
  const ProductDetails({super.key, required this.singleProduct});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int qty = 0;
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Routes.instance
                  .push(widget: const CartScreen(), context: context);
            },
            icon: const Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                widget.singleProduct.image,
                height: 300,
                width: 300,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.singleProduct.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        widget.singleProduct.isFavourite =
                            !widget.singleProduct.isFavourite;
                      });
                      if (widget.singleProduct.isFavourite) {
                        appProvider.addFavouriteProduct(widget.singleProduct);
                      } else {
                        appProvider
                            .removeFavouriteProduct(widget.singleProduct);
                      }
                    },
                    // icon: Icon(widget.singleProduct.isFavourite
                    //     ? Icons.favorite
                    //     : Icons.favorite_border),
                    icon: Icon(appProvider.getFavouriteProductList
                            .contains(widget.singleProduct)
                        ? Icons.favorite
                        : Icons.favorite_border),
                  )
                ],
              ),
              Text(widget.singleProduct.description),
              const SizedBox(
                height: 12.0,
              ),
              // if (qty == 0)
              //   Row(
              //     children: [
              //       ElevatedButton(
              //         onPressed: () {
              //           setState(() {
              //             qty++;
              //           });
              //         },
              //         child: const Text("Add To Cart"),
              //       ),
              //     ],
              //   ),
              // if (qty != 0)
              Row(
                children: [
                  CupertinoButton(
                    onPressed: () {
                      if (qty >= 1) {
                        setState(() {
                          qty--;
                        });
                      }
                    },
                    padding: EdgeInsets.zero,
                    child: const CircleAvatar(
                      child: Icon(Icons.remove),
                    ),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  Text(
                    qty.toString(),
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  CupertinoButton(
                    onPressed: () {
                      setState(() {
                        qty++;
                      });
                    },
                    padding: EdgeInsets.zero,
                    child: const CircleAvatar(
                      child: Icon(Icons.add),
                    ),
                  ),
                ],
              ),
              // const Spacer(),
              const SizedBox(
                height: 24.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      ProductModel productModel =
                          widget.singleProduct.copyWith(qty: qty);
                      appProvider.addCartProduct(productModel);
                      showMessage("Added to Cart");
                    },
                    child: const Text("Add To Cart 2"),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  SizedBox(
                    child: ElevatedButton(
                      onPressed: () {
                        Routes.instance
                            .push(widget: const Checkout(), context: context);
                      },
                      child: const Text("Add To Cart"),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
