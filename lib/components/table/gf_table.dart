import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

/// Renders sorting data grid
class GFTable extends StatefulWidget {
  /// Creates sorting data grid
  const GFTable({
    Key? key,
    required this.source,
    required this.columns,
    this.allowSorting = true,
    this.allowMultiSorting = false,
    this.allowTriStateSorting = false,
    this.allowColumnSorting = true,
    this.showSortNumbers = false,
    this.isLandscapeInMobileView = false,
    this.gridLineColor = const Color(0x0D000000),
    this.headerColor = const Color(0xfff2f2f2),
    this.gridLinesVisibility = GridLinesVisibility.horizontal,
    this.headerGridLinesVisibility = GridLinesVisibility.horizontal,
    this.columnWidthMode = ColumnWidthMode.fill,
  }) : super(key: key);

  /// DataGridSource required for SfDataGrid to obtain the row data.
  final DataGridSource source;

  /// Decide to perform sorting in SfDataGrid.
  final bool allowSorting;

  /// Decide to perform multi column sorting in SfDataGrid.
  final bool allowMultiSorting;

  /// Decide to perform tri column sorting in SfDataGrid.
  final bool allowTriStateSorting;

  /// Decide to perform sorting.
  final bool allowColumnSorting;

  /// Determine the show the sorting number in header.
  final bool showSortNumbers;

  /// Determine to decide whether the device in landscape or in portrait.
  final bool isLandscapeInMobileView;

  /// Color for gridLines
  final Color gridLineColor;

  /// Color for header background
  final Color headerColor;

  /// How the border should be visible.
  ///
  /// Decides whether vertical, horizontal, both the borders and no borders
  /// should be drawn.
  ///
  /// Defaults to [GridLinesVisibility.horizontal]
  ///
  /// Also refer [GridLinesVisibility]
  final GridLinesVisibility gridLinesVisibility;

  /// How the border should be visible in header cells.
  ///
  /// Decides whether vertical or horizontal or both the borders or no borders
  /// should be drawn.
  ///
  /// [GridLinesVisibility.horizontal] will be useful if you are using
  /// [stackedHeaderRows] to improve the readability.
  ///
  /// Defaults to [GridLinesVisibility.horizontal]
  ///
  /// Also refer [GridLinesVisibility].
  ///
  /// See also, [gridLinesVisibility] – To set the border for cells other than
  /// header cells.
  final GridLinesVisibility headerGridLinesVisibility;

  /// How the column widths are determined.
  ///
  /// Defaults to [ColumnWidthMode.none]
  ///
  /// Also refer [ColumnWidthMode]
  final ColumnWidthMode columnWidthMode;

  /// The collection of the [GridColumn].
  ///
  /// Each column associated with its own renderer and it controls the
  /// corresponding column related operations.
  ///
  /// Defaults to null.
  final List<GridColumn> columns;

  @override
  _SortingDataGridState createState() => _SortingDataGridState();
}

class _SortingDataGridState extends State<GFTable> {
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
  }

  @override
  Widget build(BuildContext context) => SfDataGridTheme(
    data: SfDataGridThemeData(
      gridLineColor: widget.gridLineColor,
      headerColor: widget.headerColor,
    ),
    child: SfDataGrid(
      source: widget.source,
      columns: widget.columns,
      gridLinesVisibility: widget.gridLinesVisibility,
      headerGridLinesVisibility: widget.headerGridLinesVisibility,
      columnWidthMode: widget.columnWidthMode,
      allowSorting: widget.allowSorting,
      allowMultiColumnSorting: widget.allowMultiSorting,
      allowTriStateSorting: widget.allowTriStateSorting,
      showSortNumbers: widget.showSortNumbers,
    ),
  );
}
