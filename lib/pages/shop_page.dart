import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/clothes_tile.dart';
import '../components/trending_tile.dart';
import '../models/cart.dart';
import '../models/clothes.dart';
import 'detail_page.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addItemToCart(Clothes clothes) {
    Provider.of<Cart>(context, listen: false).addItemsCart(clothes);

    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text(
          'Added to Cart',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        content: Text('Check your Cart'),
      ),
    );
  }

  void toDetail(Clothes clothes) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(clothes: clothes),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<Cart>(
        builder: (context, value, child) => Column(
          children: [
            //search bar
            Container(
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.only(left: 25, right: 15),
              child: Material(
                elevation: 1, 
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.search),
                          Text(
                            'Search...',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      Icon(Icons.filter_alt_outlined)
                    ],
                  ),
                ),
              ),
            ),


            const SizedBox(height: 25),

            // category clothes
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Container(
            //     height: 30,
            //     child: ListView.builder(
            //       itemCount: value.clothingTypes.length,
            //       scrollDirection: Axis.horizontal,
            //       itemBuilder: (context, index) {
            //         return Padding(
            //           padding: const EdgeInsets.symmetric(horizontal: 8.0),
            //           child: ElevatedButton(
              
            //       },
            //     ),
            //   ),
            // ),

            const SizedBox(height: 15),

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
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            // trending clothes
            SizedBox(
              height: 200, 
              child: ListView.builder(
                
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  Clothes clothes = value.getClothesList()[index];
                  return TrendingTile(
                    onTapDetail: () => toDetail(clothes),
                    clothes: clothes,
                  );
                },
              ),
            ),

            const SizedBox(height: 15),

            // clothes stock
            Padding(
              padding: EdgeInsets.only(left: 25, right: 25, bottom: 25),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Clothes',
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
                      ),
                    ],
                  ), 
                  
                  const SizedBox(height: 10),

                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 15.0, 
                      childAspectRatio: 0.571, 
                    ),
                    itemCount: 10, 
                    itemBuilder: (context, index) {
                      // return Container(
                      //   color: Colors.grey[200],
                      //   child: Center(
                      //     child: Text('Item $index'),
                      //   ),
                      // );
                      Clothes clothes = value.getClothesList()[index];
                      return ClothesTile(
                        clothes: clothes,
                        onTapDetail: () => toDetail(clothes),
                        onTap: () => addItemToCart(clothes),
                      );
                    },
                  ),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
