import 'dart:math';

import 'package:clothing/data/dummy_data.dart';
import 'package:clothing/models/clothes.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  List<Clothes> clothingStore =  DummyData.getClothingStore();

  // items in user cart
  List<Clothes> userCart = [];

  // List<String> clothingCategory = ["Jackets", "Dressers", "Hoodies", "T-shirt", "Shirt" ];

  // get the list of items for sale
  List<Clothes> getClothesList() {
    return clothingStore;
  }

  // get items from cart
  List<Clothes> getUsersCart() {
    return userCart;
  }

  List<Clothes> getTrendClothes(){
    List<Clothes> trendList = List.from(clothingStore);
    trendList.shuffle(Random());
    return trendList;
  }

  void addItemsCart(Clothes clothes){
    userCart.add(clothes);
    notifyListeners();
  }

  void removeItemsCart(Clothes clothes){
    userCart.remove(clothes);
    notifyListeners();
  }
}
