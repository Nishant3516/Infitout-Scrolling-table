import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table/bloc/scrolling_table_bloc.dart';
import 'package:table/bloc/scrolling_table_event.dart';
import 'package:table/bloc/scrolling_table_state.dart';

class ScrollingTable extends StatefulWidget {
  @override
  _ScrollingTableState createState() => _ScrollingTableState();
}

class _ScrollingTableState extends State<ScrollingTable> {
  ScrollController _leftScrollController = ScrollController();
  ScrollController _rightScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ScrollingTableBloc>(context).add(LoadTableData());

    _leftScrollController.addListener(() {
      if (_leftScrollController.offset !=
          _rightScrollController.position.maxScrollExtent -
              _rightScrollController.offset) {
        _rightScrollController.jumpTo(
            _rightScrollController.position.maxScrollExtent -
                _leftScrollController.offset);
      }
    });

    _rightScrollController.addListener(() {
      if (_rightScrollController.offset !=
          _leftScrollController.position.maxScrollExtent -
              _leftScrollController.offset) {
        _leftScrollController.jumpTo(
            _leftScrollController.position.maxScrollExtent -
                _rightScrollController.offset);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScrollingTableBloc, ScrollingTableState>(
      builder: (context, state) {
        if (state is ScrollingTableLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is ScrollingTableLoaded) {
          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      controller: _leftScrollController,
                      child: DataTable(
                        columnSpacing: 20,
                        columns: [
                          DataColumn(label: Center(child: Text('Column 1'))),
                          DataColumn(label: Center(child: Text('Column 2'))),
                          DataColumn(label: Center(child: Text('Column 3'))),
                        ],
                        rows: state.data
                            .map(
                              (row) => DataRow(
                                cells: [
                                  DataCell(Center(child: Text(row.column1))),
                                  DataCell(Center(child: Text(row.column2))),
                                  DataCell(Center(child: Text(row.column3))),
                                ],
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                  Container(
                    // width: 100,
                    child: DataTable(
                      border: TableBorder.all(
                          width: 2,
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10)),
                      columnSpacing: 20,
                      columns: [
                        DataColumn(label: Center(child: Text('Strike'))),
                        DataColumn(label: Center(child: Text('IV'))),
                      ],
                      rows: state.data
                          .map(
                            (row) => DataRow(
                              cells: [
                                DataCell(Center(child: Text(row.strike))),
                                DataCell(Center(child: Text(row.iv))),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      controller: _rightScrollController,
                      child: DataTable(
                        columnSpacing: 20,
                        columns: [
                          DataColumn(label: Center(child: Text('Column 3'))),
                          DataColumn(label: Center(child: Text('Column 2'))),
                          DataColumn(label: Center(child: Text('Column 1'))),
                        ],
                        rows: state.data
                            .map(
                              (row) => DataRow(
                                cells: [
                                  DataCell(Center(child: Text(row.column4))),
                                  DataCell(Center(child: Text(row.column5))),
                                  DataCell(Center(child: Text(row.column6))),
                                ],
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        } else {
          return Center(child: Text('Failed to load data'));
        }
      },
    );
  }

  @override
  void dispose() {
    _leftScrollController.dispose();
    _rightScrollController.dispose();
    super.dispose();
  }
}
