import 'package:table/data/models/table_data_model.dart';

class TableDataRepository {
  List<TableData> fetchData() {
    return List.generate(
      10,
      (index) => TableData(
        column1: 'C1-$index',
        column2: 'C2-$index',
        column3: 'C3-$index',
        strike: 'S-$index',
        iv: 'IV-$index',
        column4: 'C3-$index',
        column5: 'C2-$index',
        column6: 'C1-$index',
      ),
    );
  }
}
