import 'package:flutter/material.dart';
import 'package:smart_loans/config/responsive.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'order_info_data_grid_source.dart';

class ClientsTableWidget extends StatefulWidget {
  const ClientsTableWidget({super.key});

  @override
  State<ClientsTableWidget> createState() => _ClientsTableWidgetState();
}

class _ClientsTableWidgetState extends State<ClientsTableWidget> {
  /// DataGridSource required for SfDataGrid to obtain the row data.
  late ClientInfoDataGridSource clientInfoDataSource;
  int _rowsPerPage = 15;
  static const double dataPagerHeight = 60;

  Widget _buildDataGrid() {
    return SfDataGrid(source: clientInfoDataSource, columns: <GridColumn>[
      GridColumn(
        width: (Responsive.isDesktop(context)) ? 120.0 : double.nan,
        columnName: 'clientNumber',
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerRight,
          child: const Text(
            'Client Number',
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      GridColumn(
        width: (Responsive.isDesktop(context)) ? 150.0 : double.nan,
        columnWidthMode: (Responsive.isDesktop(context))
            ? ColumnWidthMode.none
            : ColumnWidthMode.fitByColumnName,
        autoFitPadding: const EdgeInsets.all(8),
        columnName: 'name',
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerRight,
          child: const Text(
            'Name',
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      GridColumn(
        width: (Responsive.isDesktop(context)) ? 120.0 : double.nan,
        columnName: 'telephone',
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Telephone',
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      GridColumn(
        width: (Responsive.isDesktop(context)) ? 110.0 : double.nan,
        columnName: 'email',
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerRight,
          child: const Text(
            'Email',
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      GridColumn(
        width: (Responsive.isDesktop(context)) ? 120.0 : double.nan,
        columnName: 'nationality',
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Nationality',
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      GridColumn(
        width: (Responsive.isDesktop(context)) ? 120.0 : double.nan,
        columnName: 'edit',
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerRight,
          child: const Text(
            'Edit',
            overflow: TextOverflow.ellipsis,
          ),
        ),
      )
    ]);
  }

  Widget _buildDataPager() {
    return
      // SfDataPagerTheme(
      // data: SfDataPagerThemeData(
      //   brightness: LightAppColor.dataGridSelected, // Use ThemeData for theming
      //   selectedItemColor: LightAppColor.dataGridSelected,
      // ),
      // child:
      SfDataPager(
        delegate: clientInfoDataSource,
        availableRowsPerPage: const <int>[15, 20, 25],
        pageCount: clientInfoDataSource.clients.length / _rowsPerPage,
        onRowsPerPageChanged: (int? rowsPerPage) {
          setState(() {
            _rowsPerPage = rowsPerPage!;
          });
        },
      );
    // );
  }

  Widget _buildLayoutBuilder() {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraint) {
      return Column(
        children: <Widget>[
          SizedBox(
              height: constraint.maxHeight - dataPagerHeight,
              width: constraint.maxWidth,
              child: _buildDataGrid()),
          Container(
            height: dataPagerHeight,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface.withOpacity(0.12),
                border: Border(
                    top: BorderSide(
                        width: .5,
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.12)))),
            child: Align(child: _buildDataPager()),
          )
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildLayoutBuilder();
  }
}
