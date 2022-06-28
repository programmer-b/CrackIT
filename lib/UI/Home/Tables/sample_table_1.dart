import 'package:crackit/app.dart';
import 'package:crackit/widgets/scrollable_wisget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SampleTable1 extends StatefulWidget {
  const SampleTable1({Key? key}) : super(key: key);

  @override
  State<SampleTable1> createState() => _SampleTable1State();
}

class _SampleTable1State extends State<SampleTable1> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PageState>(context);
    provider.getTableData(context);
    return Scaffold(
        appBar: AppBar(
          title: const Txt(text: 'Sample table 1'),
        ),
        body: provider.sampleTable.results == null
            ? const Center(child: CircularProgressIndicator())
            : ScrollableWidget(
                child: DataTable(
                    columns: const <DataColumn>[
                      DataColumn(
                          label: Txt(
                            text: 'verified',
                          ),
                          tooltip: 'Represents if the user is verified'),
                      DataColumn(
                          label: Txt(
                            text: 'First name',
                          ),
                          tooltip: 'Represents the first name of the user '),
                      DataColumn(
                          label: Txt(
                            text: 'Last name',
                          ),
                          tooltip: 'Represents last name of the user'),
                      DataColumn(
                          label: Txt(
                            text: 'Email',
                          ),
                          tooltip: 'Represents email of the user'),
                      DataColumn(
                          label: Txt(
                            text: 'Phone',
                          ),
                          tooltip: 'Represents phone number of the user'),
                    ],
                    rows: provider.sampleTable.results!
                        .map((data) => DataRow(cells: <DataCell>[
                              DataCell((data.verified ?? false)
                                  ? const Icon(
                                      Icons.verified_user,
                                      color: Colors.green,
                                    )
                                  : const Icon(
                                      Icons.cancel,
                                      color: Colors.red,
                                    )),
                              DataCell(Txt(text: data.firstName)),
                              DataCell(Txt(
                                text: data.lastName,
                              )),
                              DataCell(Txt(text: data.email)),
                              DataCell(Txt(text: data.phone))
                            ]))
                        .toList()),
              ));
  }
}
