
import 'package:book_management_software/page_1.dart';
import 'package:book_management_software/widgets/product_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class FetchScreen extends StatefulWidget {
  const FetchScreen({Key? key}) : super(key: key);

  @override
  State<FetchScreen> createState() => _FetchScreenState();
}

class _FetchScreenState extends State<FetchScreen> {

  @override
  void initState() {
  
    Future.delayed(const Duration(microseconds: 5), () async {
      final productsProvider =
          Provider.of<ProductsProvider>(context, listen: false);

      
    
        await productsProvider.fetchProducts();
     

      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (ctx) => const Add_Book(),
      )
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}
