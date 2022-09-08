import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_mall_app/shopping_mall/bloc/mall_item_bloc.dart';
import 'package:shopping_mall_app/shopping_mall/repo/mall_item_repo.dart';
import 'package:shopping_mall_app/shopping_mall/views/screens/shopping_mall_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (BuildContext context) => MallItemBloc(repository: MallItemRepository()),
        child: const ShoppingMallScreen(),
      ),
    );
  }
}

