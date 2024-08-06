import 'package:equatable/equatable.dart';
import 'package:table/data/models/table_data_model.dart';

abstract class ScrollingTableState extends Equatable {
  const ScrollingTableState();

  @override
  List<Object> get props => [];
}

class ScrollingTableInitial extends ScrollingTableState {}

class ScrollingTableLoading extends ScrollingTableState {}

class ScrollingTableLoaded extends ScrollingTableState {
  final List<TableData> data;

  const ScrollingTableLoaded({required this.data});

  @override
  List<Object> get props => [data];
}

class ScrollingTableError extends ScrollingTableState {}
