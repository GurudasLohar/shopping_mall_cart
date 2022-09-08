import 'package:equatable/equatable.dart';

import '../data/model/shopping_mall_item.dart';

abstract class MallItemState extends Equatable {}

class InitialState extends MallItemState {
  @override
  List<Object> get props => [];
}

class LoadingState extends MallItemState {
  @override
  List<Object> get props => [];
}

class SuccessState extends MallItemState {
  final List<ShoppingMallItem> mallItemList;

  SuccessState({required this.mallItemList});

  @override
  List<Object> get props => [mallItemList];
}

class ErrorState extends MallItemState {
  final String errorMessage;

  ErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
