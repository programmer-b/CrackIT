part of 'package:crackit/app.dart';

class RowsAndColumns{
  List countriesC = [
    Columns(
        const Txt(
          text: '#',
          textAlign: TextAlign.center,
        ),
        ColumnSize.S),
    Columns(
        const Txt(
          text: 'Code',
        ),
        ColumnSize.S),
    Columns(
        const Txt(
          text: 'Country',
        ),
        ColumnSize.M),
    Columns(
        const Txt(
          text: 'Status',

        ),
        ColumnSize.M),
    Columns(
        const Txt(
          text: '',
        ),
        ColumnSize.S)
  ];

  List countriesR(List<dynamic> map,int index, API provider){
    return [
      DataCell(Txt(text: index + 1)),
      DataCell(Txt(text: map[index]['code'].toString())),
      DataCell(Txt(text: map[index]['name'].toString())),
      DataCell(Padding(
        padding: const EdgeInsets.all(6.0),
        child: StatusTray(
            theme: map[index]['recordStatus']['theme'],
            label: map[index]['recordStatus']['label']),
      )),
      DataCell(OperationsMenu(
        code: int.parse(map[index]['recordStatus']['code']),
        api: provider,
        id: map[index]['id'],
        url: Urls.setup + '/country',
      ))
    ];
  }

}