import 'package:clothing/models/clothes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';

class CartItem extends StatefulWidget {
  Clothes clothes;
  CartItem({super.key, required this.clothes});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {

  void removeItemCart(){
    Provider.of<Cart>(context, listen: false).removeItemsCart(widget.clothes);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20)
      ),
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(10),
      child: ListTile(
        leading: Image.asset(widget.clothes.image),
        title: Text(widget.clothes.name),
        subtitle: Text("\$" + widget.clothes.price),
        trailing: IconButton(icon: Icon(Icons.delete), onPressed: removeItemCart,),
      ),
    );
  }
}