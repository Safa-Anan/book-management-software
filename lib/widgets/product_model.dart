import 'package:flutter/cupertino.dart';

class ProductModel with ChangeNotifier{
  final String  id,book_name, p_name, p_age,p_date,book_type;
final int page_number;

  ProductModel(
      {
      required this.book_name,
      required this.id,
      required this.p_name,
      required this.p_age,
      required this.page_number,
      required this.book_type,
           required this.p_date,
     });
}


