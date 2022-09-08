import 'package:flutter/material.dart';

import '../../../mall_cart/bloc/cart_bloc.dart';
import '../../../mall_cart/data/model/cart_item.dart';
import '../../data/model/shopping_mall_item.dart';

class MallListItem extends StatelessWidget {
  final ShoppingMallItem mallItem;

  const MallListItem({Key? key, required this.mallItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartBloc = CartBloc();
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: SizedBox(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
              child: Image.network(
                mallItem.featuredImage!,
                height: 150,

              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 10.0, right: 10, top: 4, bottom: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      mallItem.title!,
                      overflow: TextOverflow.ellipsis,
                      style:  TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold,
                        color: Colors.grey.shade600),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      cartBloc.addCartItems(
                        CartItemModel(
                          title: mallItem.title,
                          price: mallItem.price,
                          featuredImage: mallItem.featuredImage,
                        ),
                      );
                      Scaffold.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Item added to Cart"),
                        ),
                      );
                    },
                    child:  Icon(
                      Icons.shopping_cart,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
