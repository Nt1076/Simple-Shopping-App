import 'package:flutter/material.dart';
import 'package:shop_app/global_variables.dart';
import 'package:shop_app/product_details_page.dart';
import 'package:shop_app/project_card.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();

  
}

class _ProductListState extends State<ProductList> {
   final List<String> filters = const ['All','AdiDas',"Nike",'Bata']; 
   late String selectedFilter;
  


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedFilter=filters[0];
  }

  @override
  Widget build(BuildContext context) {
     const border = OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(3, 20, 20, 1)
                        ),
                        borderRadius: BorderRadius.horizontal(left: Radius.circular(40))
                      );
    return  SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text('Shoes\nCollection',
                  style:Theme.of(context). textTheme.titleLarge
                  
                  ),
                ),
                 Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search' ,
                      prefixIcon: Icon(Icons.search),
                      border:border,
                      enabledBorder: border,
                      focusedBorder: border
                    ),
                  ))
              ],
            ),

            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal
                ,
                itemCount: filters.length,
                itemBuilder:(context, index) {
                  final filter =filters[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: () {
                       setState(() {
                          selectedFilter=filter;
                       });
                        
                      },
                      child: Chip(
                        side: const BorderSide(
                          color: Color.fromRGBO(215, 218, 222, 1)
                        )  ,
                      backgroundColor:selectedFilter==filter?Theme.of(context).colorScheme.primary: Color.fromARGB(255, 215, 220, 223),
                    
                        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                        label: Text(filter,
                        
                        ),
                       labelStyle: TextStyle(fontSize: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                        ),
                        ),
                    ),
                  );
            
            
                
              },),
            ),


            Expanded(
              child: ListView.builder( 
                itemCount: products.length,
            
                itemBuilder: (context, index) {
                  final product = products[index];
            
                  return GestureDetector(
                    onTap: () {
                      
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                        return ProductDetails(product: product);
                      },));
                    },
                    child: ProductCard(
                      title: product['title']as String,
                      price: product['price']as double,
                      image: product['imageUrl'] as String,
                      backgroundColor:index.isEven?Color.fromRGBO(216, 240, 253, 1): const Color.fromRGBO(245, 247, 249, 1 ),
                      ),
                  );
                },),
            )


             
            
          ],

          
        ),
      );
  }
}