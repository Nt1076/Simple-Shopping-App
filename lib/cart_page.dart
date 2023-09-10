import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/card_provider.dart';
import 'package:shop_app/global_variables.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart= Provider.of<CartProvider>(context).cart;

    return  Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body:ListView.builder( 
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cartItem=cart[index];
         return ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(cartItem['imageUrl']as String),
            radius: 30,
          ),
          trailing: IconButton(onPressed: () {
            showDialog(
              context: context,
               builder:(context) {
                 return AlertDialog(
                  title: Text('Delete Item',
                  style: Theme.of(context).textTheme.titleMedium,
                  ),
                  content: Text('Are you sure!!'),
                  actions: [

                    TextButton(onPressed: (){
                      Navigator.of(context).pop();
                    }, child: Text('No',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),
                    )),
                    TextButton(onPressed: (){
                      Provider.of<CartProvider>(context,listen: false).removeProduct(cartItem);
                       Navigator.of(context).pop();
                       
                    }, child: Text('yes',
                     style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold
                    ),
                    ))
                  ],
                 );
               },);

            
          }, icon: Icon(Icons.delete,color: Colors.red,)),
          title: Text(
            cartItem['title'].toString(),
            style: Theme.of(context).textTheme.bodySmall,
          ),
          subtitle: Text('size:${cartItem['size']}'),
         );


        },),
    );
  }
}