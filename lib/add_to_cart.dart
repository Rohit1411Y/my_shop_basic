import 'package:flutter/material.dart';
import 'package:my_shop/cart_provider.dart';

import 'package:provider/provider.dart';
class AddToCARt extends StatelessWidget {
  const AddToCARt({super.key});

  @override
  Widget build(BuildContext context) {
   // print(4);
    //print(Provider.of<CartProvider>(context).cart);
    final cart = Provider.of<CartProvider>(context).cart;
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context ,index){
          final cartItem = cart[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(cartItem['imageUrl'].toString(),
              ),
            
            ),
            trailing: IconButton(onPressed: (){
              showDialog(context: context, builder: (context){
                return AlertDialog(title: Text(
                  'Delete Product',
                  style: Theme.of(context).textTheme.titleMedium,
                  
                ),
                content: const Text("do you want to remove the item from the cart ?? "),
                actions: [
                  TextButton(onPressed: (){
                 Navigator.of(context).pop();
                  }, child:const  Text('No',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
                  ),
                   TextButton(onPressed: (){
                    Navigator.of(context).pop();
                  Provider.of<CartProvider>(context,listen: false).removeProduct(cartItem);
                  }, child:const  Text('Yes',style: TextStyle(color: Colors.red ,fontWeight: FontWeight.bold),),
                  )
                ],
                );
              });
            }, 
            icon: const Icon(Icons.delete,
            color: Colors.red,)
            ),
           title: Text(cartItem['title'].toString(),
           style: Theme.of(context).textTheme.bodySmall,),
           subtitle: Text('Size ${cartItem['size']}'),
          );
        }),
    );
  }
}