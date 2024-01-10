import 'package:clothing/models/cart.dart';
import 'package:clothing/models/clothes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/cart_item.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => CartPageState();
}

class CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Container(
        color: Colors.grey[100],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              const Text(
                'My Cart',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
                textAlign: TextAlign.start,
              ),
        
              const SizedBox(height: 10),
        
              Expanded(
                child: ListView.builder(
                  itemCount: value.getUsersCart().length,
                  itemBuilder: (context, index) {
                    Clothes items = value.getUsersCart()[index];
        
                    return CartItem(clothes: items);
                  },
                ),  
              ),
            ],
          ),
        ),
      ) 
    );
  }
}
