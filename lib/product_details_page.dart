import 'package:flutter/material.dart';


class ProductDetatilsPage extends StatefulWidget {
  final Map<String,Object> product;
  const ProductDetatilsPage({super.key,
  required this.product,
  
  });

  @override
  State<ProductDetatilsPage> createState() => _ProductDetatilsPageState();
}
int selectedSize = 0;
class _ProductDetatilsPageState extends State<ProductDetatilsPage> {
  @override
  
  Widget build(BuildContext context) {
     List<int>X = widget.product['sizes']as List<int>;
    
    
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Details"),

      ),
      body: Center(
        child: Column(
        
          children: [
          
          Text(widget.product['title'] as String,
          style: Theme.of(context).textTheme.titleLarge,),
          const Spacer(),
          Image.asset(widget.product['imageUrl']as String),
          const Spacer(flex: 2,),
          Container(
            height: 250,
            decoration: BoxDecoration(
              color:const Color.fromRGBO(245, 247, 249, 1),
              borderRadius: BorderRadius.circular(50)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text('\$${widget.product['price']}',
              style: Theme.of(context).textTheme.titleLarge,),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                 
                  itemCount: X.length,
                  itemBuilder: (context,index){
                    final size = X[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: (){
                           
                           
                          setState(() {
                           selectedSize = size;
                            
                          });
                          
                        },
                        child: Chip(
                          label: Text(size.toString()),
                         backgroundColor: selectedSize== size ?Theme.of(context).colorScheme.primary:null,
                        ),
                      ),
                      
                    );

                  }),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(onPressed: (){
                
                }, 
                style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                            minimumSize: const Size(double.infinity, 50)
                ),
                child:  const Text("Add To Cart",style: TextStyle(color: Colors.black,fontSize: 18),),
                ),
              )
            ]),
          )
        
        ]),
      ),

    );
  }
}