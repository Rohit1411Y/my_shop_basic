import 'package:flutter/material.dart';
import 'package:my_shop/global_variables.dart';
import 'package:my_shop/home_page.dart';
import 'package:my_shop/product_details_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Lato',
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(254, 206, 1, 1),
         primary:const Color.fromRGBO(254, 206, 1, 1),
         ),
       appBarTheme: const AppBarTheme(
        titleTextStyle:TextStyle(
          fontSize: 20,
          color: Colors.black,
        )

       ),
        inputDecorationTheme: const InputDecorationTheme(hintStyle:TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 35
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          bodySmall: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          )
        ),
      ),
      home:  ProductDetatilsPage(product: products[0],)
    );
  }
}

