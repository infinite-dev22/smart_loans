import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smart_loans/config/responsive.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../../theme/light.dart';
import '../clients_title_widget.dart';
import 'client_info_data_grid_source.dart';
import 'datagrid_theme.dart';

class ClientsTableWidget extends StatefulWidget {
  const ClientsTableWidget({super.key});

  @override
  State<ClientsTableWidget> createState() => _ClientsTableWidgetState();
}

class _ClientsTableWidgetState extends State<ClientsTableWidget> {
  /// DataGridSource required for SfDataGrid to obtain the row data.
  late ClientInfoDataGridSource clientInfoDataSource;
  int _rowsPerPage = 20;
  static const double dataPagerHeight = 105;

  Widget _buildDataGrid() {
    clientInfoDataSource =
        ClientInfoDataGridSource(isWebOrDesktop: Responsive.isDesktop(context));

    return SfDataGrid(
      source: clientInfoDataSource,
      columns: <GridColumn>[
        GridColumn(
          width: (Responsive.isDesktop(context)) ? 150.0 : double.nan,
          columnName: 'clientNumber',
          label: Container(
            padding: const EdgeInsets.all(8),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Client Number',
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        GridColumn(
          width: (Responsive.isDesktop(context)) ? 250.0 : double.nan,
          columnWidthMode: (Responsive.isDesktop(context))
              ? ColumnWidthMode.none
              : ColumnWidthMode.fitByColumnName,
          autoFitPadding: const EdgeInsets.all(8),
          columnName: 'name',
          label: Container(
            padding: const EdgeInsets.all(8),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Name',
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        GridColumn(
          width: (Responsive.isDesktop(context)) ? 150.0 : double.nan,
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
          width: (Responsive.isDesktop(context)) ? 250.0 : double.nan,
          columnName: 'email',
          label: Container(
            padding: const EdgeInsets.all(8),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Email',
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        GridColumn(
          width: (Responsive.isDesktop(context)) ? 150.0 : double.nan,
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
        // GridColumn(
        //   width: (Responsive.isDesktop(context)) ? 120.0 : double.nan,
        //   columnName: 'edit',
        //   label: Container(
        //     padding: const EdgeInsets.all(8),
        //     alignment: Alignment.centerRight,
        //     child: const Text(
        //       'Edit',
        //       overflow: TextOverflow.ellipsis,
        //     ),
        //   ),
        // )
      ],
      rowsPerPage: _rowsPerPage,
      allowSorting: true,
      columnWidthMode: (Responsive.isDesktop(context) &&
              !Responsive.isMobile(context)) // or landscape
          ? ColumnWidthMode.fill
          : ColumnWidthMode.none,
    );
  }

  Widget _buildDataPager() {
    return SfDataPagerTheme(
      data: SfDataPagerThemeData(
        brightness: Brightness.light /*LightAppColor.dataGridSelected*/,
        // Use ThemeData for theming
        selectedItemColor: LightAppColor.dataGridSelected,
      ),
      child: SfDataPager(
        delegate: clientInfoDataSource,
        availableRowsPerPage: const <int>[15, 20, 25],
        pageCount: clientInfoDataSource.clients.length / _rowsPerPage,
        onRowsPerPageChanged: (int? rowsPerPage) {
          setState(() {
            _rowsPerPage = rowsPerPage!;
          });
        },
      ),
    );
  }

  Widget _buildLayoutBuilder() {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: LightAppColor.cardBg,
            spreadRadius: .5,
            blurRadius: 1,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraint) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClientsTitle(),
            Column(
              children: <Widget>[
                SizedBox(
                  height: constraint.maxHeight -
                dataPagerHeight
                      /*MediaQuery.of(context).size.height - dataPagerHeight*/,
                  width: constraint.maxWidth
                      /*MediaQuery.of(context).size.width*/,
                  child: _buildDataGrid(),
                  // ListView.builder(
                  //   itemBuilder: (BuildContext context, int index) {
                  //     return _buildDataGrid();
                  //   },
                  // ),
                ),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .surface
                          .withOpacity(0.12),
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
            ),
          ],
        ),
      ),
    );
    // return LayoutBuilder(
    //     builder: (BuildContext context, BoxConstraints constraint) {
    //   return Column(
    //     children: <Widget>[
    //       SizedBox(
    //         height: /*constraint.maxHeight -
    //             dataPagerHeight*/
    //             MediaQuery.of(context).size.height - dataPagerHeight,
    //         width: /*constraint.maxWidth*/ MediaQuery.of(context).size.width,
    //         child: _buildDataGrid(),
    //         // ListView.builder(
    //         //   itemBuilder: (BuildContext context, int index) {
    //         //     return _buildDataGrid();
    //         //   },
    //         // ),
    //       ),
    //       Container(
    //         height: 60,
    //         decoration: BoxDecoration(
    //             color: Theme.of(context).colorScheme.surface.withOpacity(0.12),
    //             border: Border(
    //                 top: BorderSide(
    //                     width: .5,
    //                     color: Theme.of(context)
    //                         .colorScheme
    //                         .onSurface
    //                         .withOpacity(0.12)))),
    //         child: Align(child: _buildDataPager()),
    //       )
    //     ],
    //   );
    // });
  }

  @override
  Widget build(BuildContext context) {
    return _buildLayoutBuilder();
  }

  @override
  void initState() {
    clientInfoDataSource =
        ClientInfoDataGridSource(isWebOrDesktop: Platform.isLinux);

    super.initState();
  }
}
