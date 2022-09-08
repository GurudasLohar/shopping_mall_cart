import '../data/model/cart_item.dart';
import 'database_provider.dart';

class DatabaseController {
  final dbClient = DatabaseProvider.dbProvider;

  Future<int> createCart(CartItemModel cartItem) async {
    final db = await dbClient.db;
    var result = db.insert("cartTable", cartItem.toJSON());
    return result;
  }

  Future<List<CartItemModel>> getAllCartItems({List<String>? columns}) async {
    final db = await dbClient.db;

    var result = await db.query("cartTable", columns: columns);

    List<CartItemModel> cartItems = result.isNotEmpty
        ? result.map((item) => CartItemModel.fromJSON(item)).toList()
        : [];
    return cartItems;
  }

  Future<int> updateCartItemQuantity(CartItemModel cartItem) async {
    final db = await dbClient.db;
    var result = await db.update("cartTable", cartItem.toJSON(),
        where: "id = ?", whereArgs: [cartItem.id]);
    return result;
  }

  Future<int> deleteCartItem(int id) async {
    final db = await dbClient.db;
    var result = await db.delete("cartTable", where: 'id = ?', whereArgs: [id]);

    return result;
  }
}
