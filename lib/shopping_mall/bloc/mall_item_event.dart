import 'package:equatable/equatable.dart';

abstract class MallItemEvent extends Equatable {
  const MallItemEvent();

  @override
  List<Object> get props => [];
}

class ReadItemEvent extends MallItemEvent {}
