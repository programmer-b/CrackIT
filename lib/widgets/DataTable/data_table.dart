part of 'package:crackit/app.dart';

class MyDataTable extends StatelessWidget {
  const MyDataTable({
    Key? key,
    required this.columns,
    required this.rows,
  }) : super(key: key);

  final List<Columns> columns;
  final List<DataRow> rows;

  @override
  Widget build(BuildContext context) {
    return DataTable2(
        dividerThickness: 0.3,
        headingRowHeight: 35,
        columnSpacing: 1,
        horizontalMargin: 1,
        minWidth: MediaQuery.of(context).size.width,
        columns: [
          for (int i = 0; i < columns.length; i++)
            DataColumn2(label: columns[i].label, size: columns[i].columnSize)
        ],
        rows: rows);
  }
}

Widget _dataTable(List<dynamic> map, API provider, BuildContext context) {
  final setup = Provider.of<SetupProvider>(context);
  List<dynamic>? columns() {
    switch (setup.name) {
      case 'country':
        return rowsAndColumns.countriesC;
      case 'designation':
        return rowsAndColumns.designationC;
      case 'employment':
        return rowsAndColumns.employmentC;
    }
    return null;
  }

  List<dynamic>? rows(List<dynamic> map, int index, API provider) {
    switch (setup.name) {
      case 'country':
        return rowsAndColumns.countriesR(map, index, provider);
      case 'designation':
        return rowsAndColumns.designationR(map, index, provider);
      case 'employment':
        return rowsAndColumns.employmentR(map, index, provider);
    }
    return null;
  }

  return DataTable(
      columns: [for (int i = 0; i < columns()!.length; i++) columns()![i]],
      rows: List<DataRow>.generate(map.length, (index) {
        return DataRow(cells: [
          for (int i = 0; i < rows(map, index, provider)!.length; i++)
            rows(map, index, provider)![i]
        ]);
      }));
}
