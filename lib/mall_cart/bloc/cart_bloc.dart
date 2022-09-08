import 'package:rxdart/rxdart.dart';
import '../data/model/cart_item.dart';
import '../repo/cart_repo.dart';

class CartBloc {
  final CartRepository repository = CartRepository();

  final PublishSubject<List<CartItemModel>> _getCartItem =
      PublishSubject<List<CartItemModel>>();

  Stream<List<CartItemModel>> get allCartItems => _getCartItem.stream;

  final PublishSubject<int> _totalItems = PublishSubject<int>();

  Stream<int> get totalCartItems => _totalItems.stream;

  final PublishSubject<int> _totalAmount = PublishSubject<int>();

  Stream<int> get totalCartAmount => _totalAmount.stream;

  CartBloc() {
    getCartItems();
  }

  getCartItems() async {
    List<CartItemModel> cartItem = await repository.getAllCartItems();
    _getCartItem.sink.add(cartItem);
  }

  addCartItems(CartItemModel cartItem) async {
    await repository.insertCartItems(cartItem);
    getCartItems();
  }

  deleteCartItems(int id) async {
    repository.deleteCartItems(id);
    getCartItems();
  }

  totalItemsAmount() {
    int amount = 0;
    _getCartItem.stream.listen((event) {
      _totalItems.sink.add(event.length);
      if (event.length == 1) {
        amount = 0;
        for (CartItemModel item in event) {
          amount = item.price!;
        }
      } else {
        amount = 0;
        for (CartItemModel item in event) {
          amount = amount + item.price!;
        }
      }
      _totalAmount.sink.add(amount);
    });
  }
}

final cartBloc = CartBloc();
