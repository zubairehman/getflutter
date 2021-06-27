import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

/// Renders sorting data grid
class GFTable extends StatefulWidget {
  /// Creates sorting data grid
  const GFTable({Key? key, required this.source}) : super(key: key);

  /// DataGridSource required for SfDataGrid to obtain the row data.
  final DataGridSource source;

  @override
  _SortingDataGridState createState() => _SortingDataGridState();
}

class _SortingDataGridState extends State<GFTable> {
  // /// DataGridSource required for SfDataGrid to obtain the row data.
  // DataGridSource source;

  /// Decide to perform sorting in SfDataGrid.
  bool allowSorting = true;

  /// Decide to perform multi column sorting in SfDataGrid.
  bool allowMultiSorting = false;

  /// Decide to perform tri column sorting in SfDataGrid.
  bool allowTriStateSorting = false;

  /// Decide to perform sorting.
  bool allowColumnSorting = true;

  /// Determine the show the sorting number in header.
  bool showSortNumbers = false;

  /// Determine to decide whether the device in landscape or in portrait.
  bool isLandscapeInMobileView = false;

  late bool isWebOrDesktop;

  @override
  void initState() {
    super.initState();
    isWebOrDesktop = true; // setting it to true for now
     widget.source.sortedColumns.add(const SortColumnDetails(
        name: 'id', sortDirection: DataGridSortDirection.descending));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    isLandscapeInMobileView = true; // setting it false for now
  }

  @override
  Widget build(BuildContext context) => SfDataGridTheme(
        data: SfDataGridThemeData(
          gridLineColor: const Color(0x0D000000),
          headerColor: const Color(0xfff2f2f2),
        ),
        child: SfDataGrid(
          source: widget.source,
          columns: getColumns(),
          gridLinesVisibility: GridLinesVisibility.both,
          headerGridLinesVisibility: GridLinesVisibility.vertical,
          columnWidthMode: ColumnWidthMode.fill,
          allowSorting: allowSorting,
          allowMultiColumnSorting: allowMultiSorting,
          allowTriStateSorting: allowTriStateSorting,
          showSortNumbers: showSortNumbers,
        ),
      );

  @override
  Widget buildSettings(BuildContext context) => StatefulBuilder(
      builder: (BuildContext context, StateSetter stateSetter) => ListView(
            shrinkWrap: true,
            children: <Widget>[
              ListTile(
                title: const Text('Allow sorting',
                    style: TextStyle(color: Colors.black)),
                trailing: Transform.scale(
                    scale: 0.8,
                    child: CupertinoSwitch(
                      value: allowSorting,
                      onChanged: (bool value) {
                        setState(() {
                          allowSorting = value;
                          stateSetter(() {});
                        });
                      },
                    )),
              ),
              ListTile(
                  title: const Text('Allow multiple column sorting',
                      style: TextStyle(color: Colors.black)),
                  trailing: Transform.scale(
                      scale: 0.8,
                      child: CupertinoSwitch(
                        value: allowMultiSorting,
                        onChanged: (bool value) {
                          setState(() {
                            allowMultiSorting = value;
                            stateSetter(() {});
                          });
                        },
                      ))),
              ListTile(
                  title: const Text('Allow tri-state sorting',
                      style: TextStyle(color: Colors.black)),
                  trailing: Transform.scale(
                      scale: 0.8,
                      child: CupertinoSwitch(
                        value: allowTriStateSorting,
                        onChanged: (bool value) {
                          setState(() {
                            allowTriStateSorting = value;
                            stateSetter(() {});
                          });
                        },
                      ))),
              ListTile(
                trailing: Transform.scale(
                    scale: 0.8,
                    child: CupertinoSwitch(
                      value: allowColumnSorting,
                      onChanged: (bool value) {
                        setState(() {
                          allowColumnSorting = value;
                          stateSetter(() {});
                        });
                      },
                    )),
                title: const Text('Allow sorting for the Name column',
                    style: TextStyle(color: Colors.black)),
              ),
              ListTile(
                  title: const Text('Display sort sequence numbers',
                      style: TextStyle(color: Colors.black)),
                  trailing: Transform.scale(
                      scale: 0.8,
                      child: CupertinoSwitch(
                        value: showSortNumbers,
                        onChanged: (bool value) {
                          setState(() {
                            showSortNumbers = value;
                            stateSetter(() {});
                          });
                        },
                      ))),
            ],
          ));

  List<GridColumn> getColumns() => <GridColumn>[
        GridTextColumn(
            columnName: 'id',
            columnWidthMode:
                !isWebOrDesktop ? ColumnWidthMode.none : ColumnWidthMode.fill,
            width: !isWebOrDesktop ? 100 : double.nan,
            label: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(8),
              child: const Text(
                'Order ID',
                overflow: TextOverflow.ellipsis,
              ),
            )),
        GridTextColumn(
            columnName: 'customerId',
            columnWidthMode:
                !isWebOrDesktop ? ColumnWidthMode.none : ColumnWidthMode.fill,
            width: !isWebOrDesktop ? 120 : double.nan,
            label: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(8),
              child: const Text(
                'Customer ID',
                overflow: TextOverflow.ellipsis,
              ),
            )),
        GridTextColumn(
            columnName: 'name',
            width: !isWebOrDesktop ? 80 : double.nan,
            label: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(8),
              child: const Text(
                'Name',
                overflow: TextOverflow.ellipsis,
              ),
            ),
            allowSorting: allowColumnSorting),
        GridTextColumn(
          columnName: 'freight',
          width: !isWebOrDesktop ? 120 : double.nan,
          label: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(8),
            child: const Text(
              'Freight',
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        GridTextColumn(
          columnName: 'city',
          width: !isWebOrDesktop ? 90 : double.nan,
          columnWidthMode:
              !isWebOrDesktop ? ColumnWidthMode.none : ColumnWidthMode.fill,
          label: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(8),
            child: const Text(
              'City',
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        GridTextColumn(
          columnName: 'price',
          width: !isWebOrDesktop ? 120.0 : double.nan,
          columnWidthMode: ColumnWidthMode.lastColumnFill,
          label: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(8),
            child: const Text(
              'Price',
              overflow: TextOverflow.ellipsis,
            ),
          ),
        )
      ];
}
