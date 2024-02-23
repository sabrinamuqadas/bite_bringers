import 'dart:convert';

import 'package:bite_bringers/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/cart_model.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});
  List<String> cart = [];

 //adding items/data to local storage
  void addToCartList(List<CartModel> cartList) {
    cart = [];
    /*converted list of objects to list of strings
    and saved into cart[] of shared preferences-(it only accepts string)*/
    cartList.forEach((element)=>cart.add(jsonEncode(element)));
    sharedPreferences.setStringList(AppConstants.CART_LIST, cart);
    //print(sharedPreferences.getStringList(AppConstants.CART_LIST));

    getCartList();
  }

  //retrieving items/data from local storage
  List< CartModel> getCartList(){
    List<String> carts = [];
    if(sharedPreferences.containsKey(AppConstants.CART_LIST)){
      carts = sharedPreferences.getStringList(AppConstants.CART_LIST)!;
      print("inside getCartList"+carts.toString());
    }
    List<CartModel> cartList = [];
    carts.forEach((element)=> cartList.add(CartModel.fromJson(jsonDecode(element))));

    return cartList;
  }
}
