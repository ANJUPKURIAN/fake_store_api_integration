import 'package:fake_store_api_integration/controller/cart_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Consumer<CartScreenController>(
          builder: (context, providerObj, _) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: providerObj.cartList.length,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(4, 6),
                                blurRadius: 6,
                                color: Colors.black.withOpacity(.4),
                              )
                            ]),
                        child: Row(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image: NetworkImage(
                                          providerObj.cartList[index].product.image ??
                                              ""))),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    providerObj.cartList[index].product.title
                                        .toString(),
                                    maxLines: 2,
                                    // overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(providerObj.cartList[index].product.price
                                      .toString())
                                ],
                              ),
                            ),
                            Spacer(),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                InkWell(
                                    onTap: () {
                                      providerObj.deleteFromCart(index);
                                    },
                                    child: Icon(Icons.delete)),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          providerObj.onDecQty(index);
                                        },
                                        child: Icon(Icons.remove)),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Text(providerObj.cartList[index].qty.toString()),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          providerObj.onIncrementQty(index);
                                        },
                                        child: Icon(Icons.add)),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
     // display totalprice in Ui
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                  padding:EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                  color: Colors.grey.withOpacity(.3),
                  child: Text(
                  providerObj.totalPrice.toStringAsFixed(2),
                  style:TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ) ,
                  
                  ),
                  
                  ),
                ),
              ],
            );
          },
        ));
  }
}