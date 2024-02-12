import 'package:flutter/material.dart';
import 'package:my_shop/add_to_cart.dart';
import 'package:my_shop/global_variables.dart';
import 'package:my_shop/product_card.dart';
import 'package:my_shop/product_details_page.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 final List<String> filters = const[
  'All',
  'Addidas',
  'Nike',
  'Puma',
  'Campus',
  'Bata'
 ];
 
 late String selectedFilter;
 @override
  void initState() {
    selectedFilter = filters[0];
    super.initState();
  }
int currentPage = 1;
  @override
  Widget build(BuildContext context) {
    const border =  OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(225, 225, 225, 1),
                         ),
                      borderRadius: BorderRadius.horizontal(left: Radius.circular(40)),
                    );
    return Scaffold(
      body:currentPage==0?
      homeScreen(border):
      const AddToCARt(),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 35,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        currentIndex: currentPage,
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home),
        label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),
        label: ''),

      ]),
    );
  }

  SafeArea homeScreen(OutlineInputBorder border) {
    return SafeArea(

      child: Column(
        children: [
        Row(
            children: [
              const  Padding(
                 padding: EdgeInsets.all(16.0),
                 child: Text("Shoes\n Collection",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
               ),
               Expanded(child: TextField(
                decoration: InputDecoration(
                  hintText: "search",
                  prefixIcon:const  Icon(Icons.search),
                  border:border,
                  enabledBorder: border,
                  focusedBorder: border,

                ),
               )),
            ],
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (context,index){
              final filter = filters[index];
              return Padding(

                padding: const EdgeInsets.symmetric(horizontal:8),
                child: GestureDetector(
                  onTap: ()  {
                    setState(() {
                        selectedFilter = filter;
                    });
                  
              
                  },
                  child: Chip(
                    backgroundColor: selectedFilter==filter? Theme.of(context).colorScheme.primary: const Color.fromRGBO(245, 247, 249, 1),
                    side: const BorderSide(color: Color.fromRGBO(245, 247, 249, 1)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    label: Text(filter),
                    padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                   labelStyle:const  TextStyle(fontSize: 16),
                  ),
                ),
              );
              }),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context,index){
              final product = products[index];
           
              return GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return ProductDetatilsPage(product: product);
                  }
                  )

                  );
                },
                child: ProductCard(title: product['title'].toString(),
                price: double.parse(product['price'].toString()),
                image: product['imageUrl'].toString(),
                              
                
                ),
              );
              
             }),
           
          ),
         
        ],

      ),
    );
  }
}