import 'package:flutter/material.dart';
import 'package:my_shop/global_variables.dart';

class ProductDetatilsPage extends StatelessWidget {
  final Map<String,Object> product;
  const ProductDetatilsPage({super.key,
  required this.product,
  
  });
    
  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Details"),

      ),
      body: Center(
        child: Column(
        
          children: [
          
          Text(product['title'] as String,
          style: Theme.of(context).textTheme.titleLarge,),
          const Spacer(),
          Image.asset(product['imageUrl']as String),
          const Spacer(flex: 2,),
        
        ]),
      ),

    );
  }
}