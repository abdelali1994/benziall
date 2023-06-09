import 'package:ecommerce_with_admin_panel/constants/routes.dart';
import 'package:ecommerce_with_admin_panel/firebase_helper/firebase_firestore_helper/firebase_firestore.dart';
import 'package:ecommerce_with_admin_panel/models/category_model/category_model.dart';
import 'package:ecommerce_with_admin_panel/screens/product_details/product_details.dart';
import 'package:flutter/material.dart';

// import '../../models/category_model/category_model.dart';
import '../../models/product_model/product_model.dart';
import '../../widgets/top_titles/top_titles.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categoriesList = [];
  List<ProductModel> productModelList = [];
  bool isLoading = false;

  @override
  void initState() {
    getCategoryList();
    super.initState();
  }

  void getCategoryList() async {
    setState(() {
      isLoading = true;
    });
    categoriesList = await FirebaseFirestoreHelper.instance.getCategories();
    productModelList = await FirebaseFirestoreHelper.instance.getBestProducts();

    productModelList.shuffle();
    setState(() {
      isLoading = false;
    });
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
                child: const CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Toptitles(subtitle: "", title: "E Commerce"),
                        TextFormField(
                          decoration:
                              const InputDecoration(hintText: "Search...."),
                        ),
                        const SizedBox(
                          height: 24.0,
                        ),
                        const Text(
                          "Categories",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  categoriesList.isEmpty
                      ? const Center(
                          child: Text("Categories is empty"),
                        )
                      : SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: categoriesList
                                .map(
                                  (e) => Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Card(
                                      color: Colors.white,
                                      elevation: 3.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: SizedBox(
                                        height: 80,
                                        width: 80,
                                        child: Image.network(e.image),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 12.0, left: 12.0),
                    child: Text(
                      "Best Selling",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  categoriesList.isEmpty
                      ? const Center(
                          child: Text("Best Product is empty"),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: GridView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              primary: false,
                              itemCount: productModelList.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisSpacing: 20,
                                      crossAxisSpacing: 20,
                                      // childAspectRatio: 0.7,
                                      crossAxisCount: 2),
                              itemBuilder: (ctx, index) {
                                ProductModel singleProduct =
                                    productModelList[index];
                                return Container(
                                    decoration: BoxDecoration(
                                      color: Colors.red.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    // color: Theme.of(context).primaryColor.withOpacity(0.3),
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 12.0,
                                        ),
                                        Image.network(
                                          singleProduct.image,
                                          height: 60,
                                          width: 60,
                                          scale: 5.0,
                                        ),
                                        const SizedBox(
                                          height: 12.0,
                                        ),
                                        Text(
                                          singleProduct.name,
                                          style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text("Price : ${singleProduct.name}"),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        SizedBox(
                                          height: 30,
                                          width: 110,
                                          child: OutlinedButton(
                                            onPressed: () {
                                              Routes.instance.push(
                                                  widget: ProductDetails(
                                                      singleProduct:
                                                          singleProduct),
                                                  context: context);
                                            },
                                            child: const Text(
                                              "Buy",
                                            ),
                                          ),
                                        )
                                      ],
                                    ));
                              }),
                        ),

                ],
              ),
            ),
    );
  }
}

// List<ProductModel> bestProducts = [
//   ProductModel(
//       image: "https://cdn-icons-png.flaticon.com/512/3030/3030821.png",
//       id: "1",
//       name: "product1",
//       price: 12.3,
//       description:
//           " had lproduit mzn khassak takhdoo darouuri hana o hatta ila ma3ajbakch ",
//       // status: "pending",
//       isFavourite: false),
//   ProductModel(
//       image: "https://jhbchev.co.za/wp-content/uploads/Oil-2.png",
//       id: "2",
//       name: "product2",
//       price: 12.3,
//       description:
//           " had lproduit mzn khassak takhdoo darouuri hana o hatta ila ma3ajbakch ",
//       // status: "pending",
//       isFavourite: false),
//   ProductModel(
//       image: "https://cdn-icons-png.flaticon.com/512/1413/1413346.png",
//       id: "3",
//       name: "product3",
//       price: 12.3,
//       description:
//           " had lproduit mzn khassak takhdoo darouuri hana o hatta ila ma3ajbakch ",
//       // status: "pending",
//       isFavourite: false),
//   ProductModel(
//       image:
//           "https://www.nicepng.com/png/full/537-5374648_plastic-bottle-clipart-fizzy-drinks-plastic-bottle-png.png",
//       id: "4",
//       name: "product4",
//       price: 12.3,
//       description:
//           " had lproduit mzn khassak takhdoo darouuri hana o hatta ila ma3ajbakch ",
//       // status: "pending",
//       isFavourite: false),
//   ProductModel(
//       image:
//           "https://www.nicepng.com/png/full/537-5374648_plastic-bottle-clipart-fizzy-drinks-plastic-bottle-png.png",
//       id: "5",
//       name: "product4",
//       price: 12.3,
//       description:
//           " had lproduit mzn khassak takhdoo darouuri hana o hatta ila ma3ajbakch ",
//       // status: "pending",
//       isFavourite: false),
//   ProductModel(
//       image:
//           "https://www.nicepng.com/png/full/537-5374648_plastic-bottle-clipart-fizzy-drinks-plastic-bottle-png.png",
//       id: "6",
//       name: "product4",
//       price: 12.3,
//       description:
//           " had lproduit mzn khassak takhdoo darouuri hana o hatta ila ma3ajbakch ",
//       // status: "pending",
//       isFavourite: false),
// ];
