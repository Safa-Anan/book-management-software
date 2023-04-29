
import 'package:book_management_software/page_1.dart';
import 'package:book_management_software/widgets/fetch_screen.dart';
import 'package:book_management_software/widgets/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
 import 'package:get_storage/get_storage.dart';
// void main() async{
//    WidgetsFlutterBinding.ensureInitialized();
// await Firebase.initializeApp();
//   runApp( MyApp());
// }

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp(
    name: "Book  App",
    options: FirebaseOptions(
    
        appId: "1:1094944452811:android:dda01926aa0c13ee99ab4e",
        messagingSenderId: "1094944452811",
        projectId: "book-management-software", apiKey: 'AIzaSyD9HP28CDKu9P44LBmP5sWAmo9QBCxC0To'),
  );

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
       return MultiProvider(
        providers:[
            
                ChangeNotifierProvider(
                create: (_) => ProductsProvider(),
              ),
            
        ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
    
        primarySwatch: Colors.blue,
      ),
      home:Add_Book(),
    ),);
  }
}


