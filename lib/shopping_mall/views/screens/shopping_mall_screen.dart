import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/mall_item_bloc.dart';
import '../../bloc/mall_item_event.dart';
import '../../bloc/mall_item_state.dart';
import '../../data/model/shopping_mall_item.dart';
import '../../../mall_cart/views/screens/my_cart_screen.dart';
import '../widget/mall_list_item.dart';

class ShoppingMallScreen extends StatefulWidget {
  const ShoppingMallScreen({Key? key}) : super(key: key);

  @override
  State<ShoppingMallScreen> createState() => _ShoppingMallScreenState();
}

class _ShoppingMallScreenState extends State<ShoppingMallScreen> {
  late MallItemBloc mallItemBloc;

  @override
  void initState() {
    super.initState();
    mallItemBloc = BlocProvider.of<MallItemBloc>(context);
    mallItemBloc.add(ReadItemEvent());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mallItemBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Shopping Mall",
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyCartScreen()),
                );
              },
            )
          ],
        ),
        body: BlocListener<MallItemBloc, MallItemState>(
          listener: (context, state) {
            if (state is ErrorState) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                ),
              );
            }
          },
          child: BlocBuilder<MallItemBloc, MallItemState>(
            builder: (context, state) {
              if (state is InitialState) {
                return loadingView();
              } else if (state is LoadingState) {
                return loadingView();
              } else if (state is SuccessState) {
                return itemListView(state.mallItemList);
              } else if (state is ErrorState) {
                return Center(
                  child: Text(state.errorMessage),
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget itemListView(List<ShoppingMallItem> itemList) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: OrientationBuilder(
          builder: (context, orientation) {
            return GridView.builder(
              clipBehavior: Clip.none,
              shrinkWrap: true,
              physics: const PageScrollPhysics(),
              itemCount: itemList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.80,
                //crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
                //childAspectRatio: orientation == Orientation.portrait ? 0.80 : 1.35,
              ),
              itemBuilder: (BuildContext context, int index) {
                return MallListItem(
                  mallItem: itemList[index],
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget loadingView() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
