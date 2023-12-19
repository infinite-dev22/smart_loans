import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_loans/data_source/models/client_model.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

/// Set client's data collection to data grid source.
class ClientInfoDataGridSource extends DataGridSource {
  /// Creates the client data source class with required details.
  ClientInfoDataGridSource(
      {required this.isWebOrDesktop,
      this.clientDataCount,
      this.clientsCollection,
      this.culture,
      bool? isFilteringSample,
      bool isGrouping = false}) {
    this.isFilteringSample = isFilteringSample ?? false;
    clients = clientsCollection ??
        getClients(clients, clientDataCount ?? 100, culture: culture ?? '');
    buildDataGridRows(isGrouping);
  }

  /// Determine to decide whether the platform is web or desktop.
  final bool isWebOrDesktop;

  /// Localization Source.
  String? culture;

  /// Get data count of an client.
  int? clientDataCount;

  /// Instance of an client.
  List<ClientModel> clients = <ClientModel>[];

  /// Instance of an client collection for rtl sample
  List<ClientModel>? clientsCollection;

  /// Instance of DataGridRow.
  List<DataGridRow> dataGridRows = <DataGridRow>[];

  /// Currency symbol for culture.
  String currencySymbol = '';

  /// Checks whether the source is used for the filtering sample or not.
  late bool isFilteringSample;

  /// Building DataGridRows.
  void buildDataGridRows(bool isGrouping) {
    dataGridRows = isWebOrDesktop
        ? clients.map<DataGridRow>((ClientModel client) {
            if (isGrouping) {
              {
                return DataGridRow(cells: <DataGridCell>[
                  DataGridCell<String>(
                      columnName: getColumnName('Client No.'),
                      value: client.clientNumber),
                  DataGridCell<String>(
                      columnName: getColumnName('Name'), value: client.name),
                  DataGridCell<String>(
                      columnName: getColumnName('Telephone'),
                      value: client.telephone),
                  DataGridCell<String>(
                      columnName: getColumnName('Email'), value: client.email),
                  DataGridCell<String>(
                      columnName: getColumnName('Nationality'),
                      value: client.nationality),
                  DataGridCell<String>(
                      columnName: getColumnName('Edit'), value: "Edit Column"),
                ]);
              }
            } else {
              return DataGridRow(cells: <DataGridCell>[
                DataGridCell<String>(
                    columnName: getColumnName('Client No.'),
                    value: client.clientNumber),
                DataGridCell<String>(
                    columnName: getColumnName('Name'), value: client.name),
                DataGridCell<String>(
                    columnName: getColumnName('Telephone'),
                    value: client.telephone),
                DataGridCell<String>(
                    columnName: getColumnName('Email'), value: client.email),
                DataGridCell<String>(
                    columnName: getColumnName('Nationality'),
                    value: client.nationality),
                DataGridCell<String>(
                    columnName: getColumnName('Edit'), value: "Edit Column"),
              ]);
            }
          }).toList()
        : clients.map<DataGridRow>((ClientModel client) {
            return DataGridRow(cells: <DataGridCell>[
              DataGridCell<String>(
                  columnName: getColumnName('Client No.'),
                  value: client.clientNumber),
              DataGridCell<String>(
                  columnName: getColumnName('Name'), value: client.name),
              DataGridCell<String>(
                  columnName: getColumnName('Telephone'),
                  value: client.telephone),
              DataGridCell<String>(
                  columnName: getColumnName('Email'), value: client.email),
              DataGridCell<String>(
                  columnName: getColumnName('Nationality'),
                  value: client.nationality),
              DataGridCell<String>(
                  columnName: getColumnName('Edit'), value: "Edit Column"),
            ]);
          }).toList();
  }

  // Overrides

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    final int rowIndex = dataGridRows.indexOf(row);
    Color backgroundColor = Colors.transparent;
    if (isWebOrDesktop) {
      return DataGridRowAdapter(color: backgroundColor, cells: <Widget>[
        Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerRight,
          child: Text(
            row.getCells()[0].value.toString(),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerRight,
          child: Text(
            row.getCells()[1].value.toString(),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: Text(
            row.getCells()[2].value.toString(),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerRight,
          child: Text(
              NumberFormat.currency(locale: 'en_US', symbol: currencySymbol)
                  .format(row.getCells()[3].value)),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: Text(
            row.getCells()[4].value.toString(),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerRight,
          child: Text(NumberFormat.currency(
                  locale: 'en_US', symbol: currencySymbol, decimalDigits: 0)
              .format(row.getCells()[5].value)),
        ),
      ]);
    } else {
      Widget buildWidget({
        AlignmentGeometry alignment = Alignment.centerLeft,
        EdgeInsetsGeometry padding = const EdgeInsets.all(8.0),
        TextOverflow textOverflow = TextOverflow.ellipsis,
        required Object value,
      }) {
        return Container(
          padding: padding,
          alignment: alignment,
          child: Text(
            value.toString(),
            overflow: textOverflow,
          ),
        );
      }

      return DataGridRowAdapter(
          color: backgroundColor,
          cells: row.getCells().map<Widget>((DataGridCell dataCell) {
            if (dataCell.columnName == getColumnName('id') ||
                dataCell.columnName == getColumnName('customerId')) {
              return buildWidget(
                  alignment: Alignment.centerRight, value: dataCell.value!);
            } else {
              return buildWidget(value: dataCell.value!);
            }
          }).toList(growable: false));
    }
  }

  @override
  Future<void> handleLoadMoreRows() async {
    await Future<void>.delayed(const Duration(seconds: 5));
    clients = getClients(clients, 15);
    buildDataGridRows(false);
    notifyListeners();
  }

  @override
  Future<void> handleRefresh() async {
    await Future<void>.delayed(const Duration(seconds: 5));
    clients = getClients(clients, 15);
    buildDataGridRows(false);
    notifyListeners();
  }

  @override
  Widget? buildTableSummaryCellWidget(
      GridTableSummaryRow summaryRow,
      GridSummaryColumn? summaryColumn,
      RowColumnIndex rowColumnIndex,
      String summaryValue) {
    Widget? widget;
    Widget buildCell(String value, EdgeInsets padding, Alignment alignment) {
      return Container(
        padding: padding,
        alignment: alignment,
        child: Text(value,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.w500)),
      );
    }

    if (summaryRow.showSummaryInRow) {
      widget = buildCell(
          summaryValue, const EdgeInsets.all(16.0), Alignment.centerLeft);
    } else if (summaryValue.isNotEmpty) {
      if (summaryColumn!.columnName == 'freight') {
        summaryValue = double.parse(summaryValue).toStringAsFixed(2);
      }

      summaryValue = 'Sum: ' +
          NumberFormat.currency(locale: 'en_US', decimalDigits: 0, symbol: r'$')
              .format(double.parse(summaryValue));

      widget = buildCell(
          summaryValue, const EdgeInsets.all(8.0), Alignment.centerRight);
    }
    return widget;
  }

  @override
  Widget? buildGroupCaptionCellWidget(
      RowColumnIndex rowColumnIndex, String summaryValue) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
        child: Text(summaryValue));
  }

  /// Provides the column name.
  String getColumnName(String columnName) {
    if (isFilteringSample) {
      switch (columnName) {
        case 'id':
          return 'Client ID';
        case 'customerId':
          return 'Customer ID';
        case 'name':
          return 'Name';
        case 'freight':
          return 'Freight';
        case 'city':
          return 'City';
        case 'price':
          return 'Price';
        default:
          return columnName;
      }
    }
    return columnName;
  }

  /// Update DataSource
  void updateDataSource() {
    notifyListeners();
  }

  /// Get clients collection
  List<ClientModel> getClients(List<ClientModel> clientData, int count,
      {String? culture}) {
    final int startIndex = clientData.isNotEmpty ? clientData.length : 0,
        endIndex = startIndex + count;

    for (int i = startIndex; i < endIndex; i++) {
      clientData.add(ClientModel(
          clientNumber: "I-0123-5678",
          name: "Qwerty Uiop",
          telephone: "0123456789",
          email: "client@testMail.com",
          nationality: "Ugandan"));
    }
    return clientData;
  }
}
