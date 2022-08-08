import 'package:flutter/material.dart';
import 'package:splash/pages/Users/Leaderboard/model.dart';
import 'package:splash/pages/Users/Leaderboard/users.dart';

class table extends StatefulWidget {
  const table({Key? key}) : super(key: key);

  @override
  State<table> createState() => _NextPageState();
}

class _NextPageState extends State<table> {
  late List<User> users;
  int? sortColumnIndex;
  bool isAscending = false;

  @override
  void initState() {
    super.initState();

    this.users = List.of(allUsers);
  }

  @override
  Widget buildDataTable() {
    final columns = ['Position', 'Username', 'Score'];
    int compareString(bool ascending, String value1, String value2) {
      return ascending ? value1.compareTo(value2) : value2.compareTo(value1);
    }

    void onSort(int columnIndex, bool ascending) {
      if (columnIndex == 0) {
        users.sort((user1, user2) =>
            compareString(ascending, "${user1.position}", "${user2.position}"));
      } else if (columnIndex == 1) {
        users.sort((user1, user2) =>
            compareString(ascending, user1.username, user2.username));
      } else if (columnIndex == 2) {
        users.sort((user1, user2) =>
            compareString(ascending, "${user1.score}", "${user2.score}"));
      }

      setState(() {
        this.sortColumnIndex = columnIndex;
        this.isAscending = ascending;
      });
    }

    List<DataColumn> getColumns(List<String> columns) => columns
        .map((String column) => DataColumn(
              label: Text(
                column,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              onSort: onSort,
            ))
        .toList();

    List<DataCell> getCells(List<dynamic> cells) =>
        cells.map((data) => DataCell(Text("$data"))).toList();

    List<DataRow> getRows(List<User> rows) => users.map((User user) {
          final cells = [user.position, user.username, user.score];

          return DataRow(cells: getCells(cells));
        }).toList();

    return DataTable(
      sortAscending: isAscending,
      sortColumnIndex: sortColumnIndex,
      columns: getColumns(columns),
      rows: getRows(users),
    );
  }

  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          child: buildDataTable(),
        ),
      ),
    );
  }
}
