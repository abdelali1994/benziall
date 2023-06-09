import 'package:ecommerce_with_admin_panel/firebase_helper/firebase_firestore_helper/firebase_firestore.dart';
import 'package:ecommerce_with_admin_panel/models/category_model/category_model.dart';
import 'package:ecommerce_with_admin_panel/models/product_model/product_model.dart';
import 'package:flutter/material.dart';

class CategoryView  extends StatefulWidget { 
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
    productModelList = await FirebaseFirestoreHelper.instance.getCategoryViewProduct(widget.categoryModel.id);

    productModelList.shuffle();
    setState(() {
      isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}