import 'package:book_management_software/widgets/text_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ViewBookList extends StatefulWidget {
  const ViewBookList({super.key});

  @override
  State<ViewBookList> createState() => _ViewBookListState();
}

class _ViewBookListState extends State<ViewBookList> {
  @override
  Widget build(BuildContext context) {

    return SafeArea(child: Scaffold(
      
      appBar: AppBar(
       
        centerTitle: true,
         elevation: 0,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title:  TextWidget(color: Colors.black,text:'View Book List',),
  
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Books").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        
        if (snapshot.hasData){
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context,i){
             QueryDocumentSnapshot data= snapshot.data!.docs[i];
            return Container(
              height: 100,
              width: double.infinity,
              color: Color.fromARGB(255, 37, 141, 155),
            margin: EdgeInsets.only(bottom:6,top: 2),
             

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                TextWidget(text: data['book_name'], color: Colors.black)
                
              ],
            ),);
          });

        }
        return Center(child: CircularProgressIndicator(),);
      },),
    ));
    
  }
}



// import 'package:book_management_software/widgets/product_model.dart';
// import 'package:book_management_software/widgets/text_widget.dart';

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';


// class ViewBookList extends StatefulWidget {

//   const ViewBookList({Key? key}) : super(key: key);

//   @override
//   State<ViewBookList> createState() => _ViewBookListState();
// }

// class _ViewBookListState extends State<ViewBookList> {
//   final _quantityTextController = TextEditingController();
//   @override
//   void initState() {
//     _quantityTextController.text = '1';
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _quantityTextController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {

//     final productModel = Provider.of<ProductModel>(context);

//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Material(
//         borderRadius: BorderRadius.circular(12),
//         color: Theme.of(context).cardColor,
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Container(
//             child: Row(
//              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//              crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
                  
//                       TextWidget(
//                       text:productModel.book_name,
//                       color: Colors.black,
//                       maxLines: 2,
//                       textSize: 18,
//                       isTitle: true,
                 
//                     ),
                 
//                   ],
//                 ),
               
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
