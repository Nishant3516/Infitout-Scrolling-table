import 'package:equatable/equatable.dart';

abstract class ScrollingTableEvent extends Equatable {
  const ScrollingTableEvent();

  @override
  List<Object> get props => [];
}

class LoadTableData extends ScrollingTableEvent {}
