import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class EmptyProdWidget extends StatefulWidget {
  const EmptyProdWidget({super.key});

  @override
  State<EmptyProdWidget> createState() => _EmptyProdWidgetState();
}

class _EmptyProdWidgetState extends State<EmptyProdWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder(child: Text('No books found, please try another keyword'),);
  }
}