import 'package:book_management_software/widgets/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/cupertino.dart';


class ProductsProvider with ChangeNotifier {
  static List<ProductModel> _productsList = [];
  List<ProductModel> get getProducts {
    return _productsList;
  }


  Future<void> fetchProducts() async {
    await FirebaseFirestore.instance
        .collection('Books')
        .get()
        .then((QuerySnapshot productSnapshot) {
      _productsList = [];
      productSnapshot.docs.forEach((element) {
        _productsList.insert(
            0,
            ProductModel(
              id:element.get('id'),
              book_name: element.get('book_name'),
              p_name: element.get('Publisher Name'),
             
               p_age: element.get('Publisher age'),
              page_number: element.get('Page Number'),
            p_date: element.get('Publish Date'),
            book_type: element.get('Type')
            ));
      });
    });
    notifyListeners();
  }

  ProductModel findProdById(String productId) {
    return _productsList.firstWhere((element) => element.id == productId);
  }

  List<ProductModel> findByCategory(String categoryName) {
    List<ProductModel> _categoryList = _productsList
        .where((element) => element.book_name
            .toLowerCase()
            .contains(categoryName.toLowerCase()))
        .toList();
    return _categoryList;
  }

  List<ProductModel> searchQuery(String searchText) {
    List<ProductModel> _searchList = _productsList
        .where(
          (element) => element.book_name.toLowerCase().contains(
                searchText.toLowerCase(),
              ),
        )
        .toList();
    return _searchList;
  }
}