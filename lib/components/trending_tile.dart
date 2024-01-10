import 'package:clothing/models/clothes.dart';
import 'package:flutter/material.dart';

class TrendingTile extends StatelessWidget {
  Clothes clothes;
  TrendingTile({super.key, required this.clothes});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      width: 100,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              clothes.image,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            clothes.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text(
            "\$" + clothes.price,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
