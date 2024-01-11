import 'package:clothing/models/clothes.dart';
import 'package:flutter/material.dart';

class ClothesTile extends StatelessWidget {
  Clothes clothes;
  void Function()? onTap;
  void Function()? onTapDetail;
  ClothesTile(
      {Key? key,
      required this.clothes,
      required this.onTapDetail,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 2,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: onTapDetail,
        child: Column(
          children: [
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  clothes.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Expanded(
            // child:
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisSize: MainAxisSize.min,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Expanded(
                  //   child:
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 10),
                  //   child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        clothes.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        clothes.description.length > 20
                            ? '${clothes.description.substring(0, 25)}...'
                            : clothes.description,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: 10,
                        ),
                      ),
                      Text(
                        '\$${clothes.price}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  // ),
                  
                  // ),
                ],
              ),
            ),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal:14, vertical: 6.4),
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: const Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
