import 'package:clothing/models/clothes.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  List<Clothes> clothingStore = [
    Clothes(
      name: 'Baju 1',
      price: '100',
      description: 'Baju 1 bagus',
      image: 'lib/images/1.jpg',
    ),
    Clothes(
      name: 'Baju 2',
      price: '200',
      description: 'Baju 2 lebih bagus dari baju 1',
      image: 'lib/images/2.jpg',
    ),
    Clothes(
      name: 'Baju 3',
      price: '300',
      description: 'Baju 3 lebih bagus dari baju 2',
      image: 'lib/images/3.jpg',
    ),
    Clothes(
      name: 'Baju 4',
      price: '400',
      description: 'Baju 4 lebih bagus dari baju 3',
      image: 'lib/images/4.jpg',
    ),
    Clothes(
      name: 'Baju 5',
      price: '500',
      description: 'Baju 5 lebih bagus dari baju 4',
      image: 'lib/images/5.jpg',
    ),
  ];

  // items in user cart
  List<Clothes> userCart = [];

  // get the list of items for sale
  List<Clothes> getClothesList() {
    return clothingStore;
  }

  // get items from cart
  List<Clothes> getUsersCart() {
    return userCart;
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
