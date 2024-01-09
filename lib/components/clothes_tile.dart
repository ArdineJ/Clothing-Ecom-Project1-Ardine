import 'package:clothing/models/clothes.dart';
import 'package:flutter/material.dart';

class ClothesTile extends StatelessWidget {
  Clothes clothes;
  void Function()? onTap;
  ClothesTile({super.key, required this.clothes, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25),
      width: 250,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child:  Image.asset(
              clothes.image,
            ),
          ),

          Text(
            clothes.description,
            style: TextStyle(color: Colors.grey[600]),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [ 
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [ 
                    Text(
                      clothes.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23 
                      ),
                    ),
            
                    Text(
                      clothes.price,
                      style: const TextStyle(
                        color: Colors.grey
                      ),
                    ),
                  ],
                ),
            
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ), 
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}