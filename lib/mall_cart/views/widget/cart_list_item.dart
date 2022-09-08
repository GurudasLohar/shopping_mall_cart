import 'package:flutter/material.dart';

import '../../data/model/cart_item.dart';

class CartListItem extends StatelessWidget {
  final CartItemModel cartItemModel;

  const CartListItem({Key? key, required this.cartItemModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              cartItemModel.featuredImage!,
              height: 100,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartItemModel.title!,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Price"),
                      Text("\$ ${cartItemModel.price!.toString()}"),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Quantity"),
                      Text("1"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
