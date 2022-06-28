import 'package:crackit/app.dart';
import 'package:crackit/models/user.dart';
import 'package:crackit/utils/text_dialog_widget.dart';
import 'package:crackit/widgets/scrollable_wisget.dart';
import 'package:flutter/material.dart';

class SampleTable2 extends StatefulWidget {
  const SampleTable2({Key? key}) : super(key: key);

  @override
  State<SampleTable2> createState() => _SampleTable2State();
}

class _SampleTable2State extends State<SampleTable2> {
  late List<User> users;

  @override
  void initState() {
    super.initState();

    users = List.of(allUsers);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Txt(text: 'Sample table 2'),
        ),
        body: ScrollableWidget(child: buildDataTable()),
      );

  Widget buildDataTable() {
    final columns = ["First Name", "Last Name", "Age"];
    return DataTable(
      columns: getColumns(columns),
      rows: getRows(users),
    );
  }

  List<DataColumn> getColumns(List<String> columns) {
    return columns.map((String column) {
      final isAge = column == columns[2];
      return DataColumn(label: Txt(text: column), numeric: isAge);
    }).toList();
  }

  List<DataRow> getRows(List<User> users) => users.map((User user) {
        final cells = [user.firstName, user.lastName, user.age];
        return DataRow(
            cells: Utils.modelBuilder(cells, (index, cell) {
          final showEditIcon = index == 0 || index == 1;
          return DataCell(Txt(text: '$cell'), showEditIcon: showEditIcon,
              onTap: () {
            switch (index) {
              case 0:
                editFirstName(user);
                break;
              case 1:
                editLastName(user);
                break;
              default:
            }
          });
        }));
      }).toList();

  Future editFirstName(User editUser) async {
    final firstName = await showTextDialog(context,
        title: 'Change First Name', value: editUser.firstName);

    setState(() => users = users.map((user) {
          final isEditedUser = user == editUser;

          return isEditedUser ? user.copy(firstName: firstName) : user;
        }).toList());
  }

  Future editLastName(User editUser) async {
    final lastName = await showTextDialog(context,
        title: 'Change Last Name', value: editUser.lastName);

    setState(() => users = users.map((user) {
          final isEditedUser = user == editUser;

          return isEditedUser ? user.copy(lastName: lastName) : user;
        }).toList());
  }
}
