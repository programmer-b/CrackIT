part of 'package:crackit/app.dart';

class DataTable extends StatelessWidget {
  const DataTable({
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
