import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table/bloc/scrolling_table_event.dart';
import 'package:table/bloc/scrolling_table_state.dart';
import 'package:table/data/repository/table_data_repository.dart';

class ScrollingTableBloc
    extends Bloc<ScrollingTableEvent, ScrollingTableState> {
  final TableDataRepository repository;

  ScrollingTableBloc({required this.repository})
      : super(ScrollingTableInitial()) {
    on<LoadTableData>(_onLoadTableData);
  }

  void _onLoadTableData(
      LoadTableData event, Emitter<ScrollingTableState> emit) async {
    emit(ScrollingTableLoading());
    try {
      final data = repository.fetchData();
      emit(ScrollingTableLoaded(data: data));
    } catch (_) {
      emit(ScrollingTableError());
    }
  }
}
