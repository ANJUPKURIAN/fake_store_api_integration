import 'package:fake_store_api_integration/model/cartmodel.dart';
import 'package:fake_store_api_integration/model/products_res_model.dart';
import 'package:fake_store_api_integration/view/home_screen/cart_screen/cart_screen.dart';
import 'package:flutter/material.dart';

class CartScreenController with ChangeNotifier {
  List<CartModel> cartList = [];

  double totalPrice = 0;

  addToCart(ProductsResModel product, BuildContext context) {
    final isCarted =
        cartList.any((element) => element.product.id == product.id);

    if (isCarted) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CartScreen(),
          ));
      print("already in cart");
    } else {
      cartList.add(CartModel(product: product));
    }
    
    calculateTotal();
    notifyListeners();
  }

  deleteFromCart(int index) {
    cartList.removeAt(index);
    calculateTotal();// item changes total changes
    notifyListeners();
  }

  onIncrementQty(int index) {
    cartList[index].qty = cartList[index].qty + 1;
    calculateTotal();
    notifyListeners();
  }

  onDecQty(int index) {
    if (cartList[index].qty > 1) {
      cartList[index].qty = cartList[index].qty - 1;
      calculateTotal();
      notifyListeners();
    }
  }

 // function for calculating total price
  calculateTotal(){
    totalPrice = 0;// other wise it doesnot clear the previous calculated amount from cart
    // for in loop
    for(var element in cartList)
    {
      totalPrice = totalPrice + (element.qty * (element.product.price ?? 0)); // element null,price is zero
    }

    print("total : $totalPrice"); 
    notifyListeners();
  }
}