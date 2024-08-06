import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table/bloc/scrolling_table_bloc.dart';
import 'package:table/data/repository/table_data_repository.dart';
import 'package:table/ui/scrolling_table.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Scrolling Table'),
        ),
        body: BlocProvider(
          create: (context) =>
              ScrollingTableBloc(repository: TableDataRepository()),
          child: ScrollingTable(),
        ),
      ),
    );
  }
}
