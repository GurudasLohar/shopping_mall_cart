import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/model/shopping_mall_item.dart';
import '../repo/mall_item_repo.dart';
import 'mall_item_event.dart';
import 'mall_item_state.dart';

class MallItemBloc extends Bloc<MallItemEvent, MallItemState> {
  MallItemRepo repository;

  MallItemBloc({required this.repository}) : super(InitialState()) {
    on<ReadItemEvent>(
      (event, emit) async {
        try {
          emit(LoadingState());
          List<ShoppingMallItem> items = await repository.getMallItemList();
          emit(SuccessState(mallItemList: items));
        } catch (error) {
          emit(ErrorState(errorMessage: error.toString()));
        }
      },
    );
  }
}
