

import 'package:book_management_software/page_2.dart';
import 'package:book_management_software/widgets/empty_product.dart';
import 'package:book_management_software/widgets/product_model.dart';
import 'package:book_management_software/widgets/product_provider.dart';
import 'package:flutter/material.dart';


import 'package:provider/provider.dart';


import '../widgets/text_widget.dart'; 
class Report_Screen extends StatefulWidget {
  const Report_Screen({super.key});
 
  @override
  State<Report_Screen> createState() => _Report_ScreenState();
}

class _Report_ScreenState extends State<Report_Screen> {
  final TextEditingController? _searchTextController = TextEditingController();
  final FocusNode _searchTextFocusNode = FocusNode();
  List<ProductModel> listProdcutSearch = [];
  @override
  void dispose() {
    _searchTextController!.dispose();
    _searchTextFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
 
    final productsProvider = Provider.of<ProductsProvider>(context);
    final catName = ModalRoute.of(context)!.settings.arguments as String;
    List<ProductModel> productByCat = productsProvider.findByCategory(catName);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
    
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          centerTitle: true,
          title: TextWidget(
            text: 'Search any book',
            color:Colors.black,
            isTitle: true,
          ),
        ),
        body: productByCat.isEmpty
            ? const EmptyProdWidget(
                
              )
            : SingleChildScrollView(
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: kBottomNavigationBarHeight,
                      child: TextField(
                        focusNode: _searchTextFocusNode,
                        controller: _searchTextController,
                        onChanged: (valuee) {
                          setState(() {
                            listProdcutSearch =
                                productsProvider.searchQuery(valuee);
                          });
                        },
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                                color: Colors.greenAccent, width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                                color: Colors.greenAccent, width: 1),
                          ),
                          hintText: "What's in your mind",
                          prefixIcon: const Icon(Icons.search),
                          suffix: IconButton(
                            onPressed: () {
                              _searchTextController!.clear();
                              _searchTextFocusNode.unfocus();
                            },
                            icon: Icon(
                              Icons.close,
                              color: _searchTextFocusNode.hasFocus
                                  ? Colors.red
                                  : Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  _searchTextController!.text.isNotEmpty &&
                          listProdcutSearch.isEmpty
                      ? const EmptyProdWidget(
                        
                          )
                      : GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 1,
                          padding: EdgeInsets.zero,
                        
                          childAspectRatio:200/250,
                          children: List.generate(
                              _searchTextController!.text.isNotEmpty
                                  ? listProdcutSearch.length
                                  : productByCat.length, (index) {
                            return ChangeNotifierProvider.value(
                              value: _searchTextController!.text.isNotEmpty
                                  ? listProdcutSearch[index]
                                  : productByCat[index],
                              child: const ViewBookList(),
       
                            );
                          }),
                        ),
                ]),
              ),
              
      ),
    );
  }
}
