import 'package:clothing/components/clothes_tile.dart';
import 'package:clothing/models/clothes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  void addItemToCart(Clothes clothes){
    Provider.of<Cart>(context, listen: false).addItemsCart(clothes);

    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        title: Text(
          'Added to Cart',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        content: Text(
          'Check your Cart'
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
      children: [
        //search bar
        Container(
          height: 60,
          padding: EdgeInsets.symmetric(horizontal: 20),
          margin: EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(10),
          ),

          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Search',
                style: TextStyle(color: Colors.grey),
              ),
              Icon(Icons.search),
            ],
          ),
        ),

        const SizedBox(height: 25),

        // trending
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Trending 🔥',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),

              Text(
                'See all',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              )
            ],
          ),
        ),

        const SizedBox(height: 10),

        Expanded(
          child: ListView.builder(
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index){
              Clothes clothes = value.getClothesList()[index];
              return ClothesTile(
                clothes: clothes,
                onTap: () => addItemToCart(clothes),
              );
            },
          ),
        ),

        // const Padding(
        //   padding: EdgeInsets.only(top: 25, left: 25, right: 25),
        //   child: Divider(
        //     color: Colors.white,
        //   ), 
        // ),
        ],
      ),
    );
  }
}
