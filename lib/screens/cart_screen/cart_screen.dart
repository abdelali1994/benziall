import 'package:ecommerce_with_admin_panel/constants/constants.dart';
import 'package:ecommerce_with_admin_panel/constants/routes.dart';
import 'package:ecommerce_with_admin_panel/provider/app_provider.dart';
import 'package:ecommerce_with_admin_panel/screens/cart_item_checkout/cart_item_checkout.dart';
import 'package:ecommerce_with_admin_panel/screens/cart_screen/widgets/single_cart_item.dart';
import 'package:ecommerce_with_admin_panel/screens/check_out/check_out.dart';
import 'package:ecommerce_with_admin_panel/widgets/Primary_button/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // int qty = 0;
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 180,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "\$${appProvider.totalPrice().toString()}",
                    style: const TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(
                height: 12.0,
              ),
              PrimaryButton(
                title: "Checkout",
                onPressed: () {
                  appProvider.clearBuyProduct();
                  appProvider.addBuyProductCartList();
                  appProvider.clearCart();
                  if (appProvider.getBuyProductList.isEmpty) {
                    showMessage("Cart is empty");
                  } else {
                    Routes.instance.push(
                        widget: const CartItemCheckout(), context: context);
                  }
                },
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Cart Screen",
          style: TextStyle(
            color: Colors.black,
            // fontSize: 18.0,
            // fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: appProvider.getCartProductList.isEmpty
          ? const Center(
              child: Text("Cart is Empty "),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12.0),
              itemCount: appProvider.getCartProductList.length,
              itemBuilder: (ctx, index) {
                return SingleCartItem(
                  singleProduct: appProvider.getCartProductList[index],
                );
                // Container(
                //   margin: const EdgeInsets.only(bottom: 12.0),
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(
                //       12,
                //     ),
                //     border: Border.all(color: Colors.red, width: 2.3),
                //   ),
                //   child: Row(children: [
                //     Expanded(
                //       child: Container(
                //         height: 140,
                //         color: Colors.red.withOpacity(0.5),
                //         child: Image.network(
                //             "https://www.transparentpng.com/thumb/laptop/9oRuDc-refreshed-pavilion-gaming-series-launching-next-month.png"),
                //       ),
                //     ),
                //     Expanded(
                //       flex: 2,
                //       child: SizedBox(
                //         height: 140,
                //         child: Padding(
                //           padding: const EdgeInsets.all(12.0),
                //           child: Row(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: [
                //                   const Text(
                //                     "Laptop",
                //                     style: TextStyle(
                //                       fontSize: 18.0,
                //                       fontWeight: FontWeight.bold,
                //                     ),
                //                   ),
                //                   Row(
                //                     children: [
                //                       CupertinoButton(
                //                         onPressed: () {
                //                           if (qty >= 1) {
                //                             setState(() {
                //                               qty--;
                //                             });
                //                           }
                //                         },
                //                         padding: EdgeInsets.zero,
                //                         child: const CircleAvatar(
                //                           maxRadius: 13.0,
                //                           child: Icon(Icons.remove),
                //                         ),
                //                       ),
                //                       Text(
                //                         qty.toString(),
                //                         style: const TextStyle(
                //                           fontSize: 22,
                //                           fontWeight: FontWeight.bold,
                //                         ),
                //                       ),
                //                       CupertinoButton(
                //                         onPressed: () {
                //                           setState(() {
                //                             qty++;
                //                           });
                //                         },
                //                         padding: EdgeInsets.zero,
                //                         child: const CircleAvatar(
                //                           maxRadius: 13.0,
                //                           child: Icon(Icons.add),
                //                         ),
                //                       ),
                //                     ],
                //                   ),
                //                   CupertinoButton(
                //                     padding: EdgeInsets.zero,
                //                     onPressed: () {},
                //                     child: const Text(
                //                       " Add To wishlist",
                //                       style: TextStyle(
                //                         fontSize: 12.0,
                //                         fontWeight: FontWeight.bold,
                //                       ),
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //               const Text(
                //                 " 123dh",
                //                 style: TextStyle(
                //                   fontSize: 18.0,
                //                   fontWeight: FontWeight.bold,
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ),
                //         // color: Color.fromARGB(255, 81, 56, 54).withOpacity(0.5),
                //       ),
                //     ),
                //     // Image.network(
                //     //     "https://www.transparentpng.com/thumb/laptop/9oRuDc-refreshed-pavilion-gaming-series-launching-next-month.png"),
                //   ]),
                // );
              }),
    );
  }
}
