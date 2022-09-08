import '../data/model/cart_item.dart';
import '../database/database_controller.dart';

class CartRepository {
  final DatabaseController dbController = DatabaseController();

  Future getAllCartItems() => dbController.getAllCartItems();

  Future insertCartItems(CartItemModel cartItem) =>
      dbController.createCart(cartItem);

  Future updateCartItems(CartItemModel cartItem) =>
      dbController.updateCartItemQuantity(cartItem);

  Future deleteCartItems(int index) => dbController.deleteCartItem(index);
}
