import 'package:flutter/material.dart';
import 'package:shopping_mall_app/mall_cart/bloc/cart_bloc.dart';
import '../../data/model/cart_item.dart';
import '../widget/cart_list_item.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({Key? key}) : super(key: key);

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartBloc = CartBloc();
    cartBloc.getCartItems();
    cartBloc.totalItemsAmount();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "My Cart",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            StreamBuilder<List<CartItemModel>>(
              stream: cartBloc.allCartItems,
              builder: (context, AsyncSnapshot<List<CartItemModel>> snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              right: 20.0, left: 20, top: 15),
                          child: GestureDetector(
                            onTap: () {
                              cartBloc.deleteCartItems(
                                  snapshot.data![index].id!.toInt());
                              Scaffold.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Item deleted successfully"),
                                ),
                              );
                            },
                            child: CartListItem(
                              cartItemModel: snapshot.data![index],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      snapshot.error.toString(),
                    ),
                  );
                } else if (snapshot.data == null) {
                  return const Center(
                    child: Text(
                      "Your cart is empty",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
            Container(
              color: Colors.blue.shade100,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Total Items: ",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.normal),
                        ),
                        StreamBuilder<int>(
                            stream: cartBloc.totalCartItems,
                            builder: (context, AsyncSnapshot<int> snapshot) {
                              return Text(
                                snapshot.data.toString(),
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              );
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Grand Total: ",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.normal),
                        ),
                        StreamBuilder<int>(
                            stream: cartBloc.totalCartAmount,
                            builder: (context, AsyncSnapshot<int> snapshot) {
                              return Text(
                                snapshot.data.toString(),
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              );
                            }),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
