import 'package:fake_store_api_integration/controller/cart_screen_controller.dart';
import 'package:fake_store_api_integration/controller/home_screen_controller.dart';
import 'package:fake_store_api_integration/view/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>HomeScreenController()),
        ChangeNotifierProvider(create: (context)=>CartScreenController()),
        ],
        
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
       
      ),
    );
  }
}
