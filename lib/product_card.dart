import 'package:flutter/material.dart';
class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  const ProductCard({super.key,
  required this.title,
  required this.price,
  required this.image,
  });


  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
   
      decoration:const  BoxDecoration(
      color: Color.fromARGB(255, 238, 212, 243),
      borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(title,style: Theme.of(context).textTheme.titleMedium,),
        const SizedBox(height:5,),
        Text('\$$price',style: Theme.of(context).textTheme.bodySmall,),
        const SizedBox(height: 5,),
        Center(
          child: Image(image: AssetImage(image),
           height: 150,),
        ),
        const SizedBox(height: 20,),

      ]),
    );
  }
}