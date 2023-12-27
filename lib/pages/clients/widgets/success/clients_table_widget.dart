import 'dart:async';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_data_table/web_data_table.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_loans/config/responsive.dart';
import 'package:smart_loans/pages/clients/widgets/success/smaple_data.dart';

class ClientsTableWidget extends StatefulWidget {
  const ClientsTableWidget({super.key});

  @override
  State<ClientsTableWidget> createState() => _ClientsTableWidgetState();
}

class _ClientsTableWidgetState extends State<ClientsTableWidget> {
  late String _sortColumnName;
  late bool _sortAscending;
  List<String>? _filterTexts;
  bool _willSearch = true;
  Timer? _timer;
  int? _latestTick;
  List<String> _selectedRowKeys = [];
  int _rowsPerPage = 20;

  /// DataGridSource required for SfDataGrid to obtain the row data.

  Widget _buildLayoutBuilder() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraint) => SizedBox(
        width: constraint.maxWidth,
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Builder(builder: (context) {
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.16,
          child: WebDataTable(
            header: const Text('Clients'),
            actions: _buildActions,
            source: WebDataTableSource(
              sortColumnName: _sortColumnName,
              sortAscending: _sortAscending,
              filterTexts: _filterTexts,
              columns: [
                WebDataColumn(
                  name: 'clientNo',
                  label: const Text('Client No.'),
                  dataCell: (value) => DataCell(Text('$value')),
                ),
                WebDataColumn(
                  name: 'name',
                  label: const Text('Name'),
                  dataCell: (value) => DataCell(Text('$value')),
                ),
                WebDataColumn(
                  name: 'telephone',
                  label: const Text('Telephone'),
                  dataCell: (value) => DataCell(Text('$value')),
                ),
                WebDataColumn(
                  name: 'email',
                  label: const Text('Email)'),
                  dataCell: (value) => DataCell(Text('$value')),
                ),
                WebDataColumn(
                  name: 'nationality',
                  label: const Text('Nationality'),
                  dataCell: (value) => DataCell(Text('$value')),
                ),
              ],
              rows: SampleData().data,
              selectedRowKeys: _selectedRowKeys,
              onTapRow: (rows, index) {
                Navigator.pushNamed(context, "/client");
              },
              onSelectRows: (keys) {
                print('onSelectRows(): count = ${keys.length} keys = $keys');
                setState(() {
                  _selectedRowKeys = keys;
                });
              },
              primaryKeyName: 'clientNo',
            ),
            horizontalMargin: 100,
            onPageChanged: (offset) {
              print('onPageChanged(): offset = $offset');
            },
            onSort: (columnName, ascending) {
              print(
                  'onSort(): columnName = $columnName, ascending = $ascending');
              setState(() {
                _sortColumnName = columnName;
                _sortAscending = ascending;
              });
            },
            onRowsPerPageChanged: (rowsPerPage) {
              print('onRowsPerPageChanged(): rowsPerPage = $rowsPerPage');
              setState(() {
                if (rowsPerPage != null) {
                  _rowsPerPage = rowsPerPage;
                }
              });
            },
            rowsPerPage: _rowsPerPage,
          ),
        );
      }),
    );
  }

  List<Widget> get _buildActions {
    return [
      SizedBox(
        width: 40.w,
        child: TextFormField(
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            hintText: "Search clients",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onChanged: (text) {
            _filterTexts = text.trim().split(' ');
            _willSearch = false;
            _latestTick = _timer?.tick;
          },
        ),
      ),
      SizedBox(width: 1.w),
      if (_selectedRowKeys.isNotEmpty)
        _buildButton(
          "Delete",
          () {
            setState(() {
              _selectedRowKeys.clear();
            });
          },
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.red)),
        ),
      if (!Responsive.isMobile(context) && !Responsive.isTablet(context))
        _buildButton("Copy", () {}),
      _buildButton("Export", () {}),
      if (!Responsive.isMobile(context)) _buildButton("Filter", () {}),
      _buildButton("Add", () async {
        _buildAddForm();
      }),
    ];
  }

  Widget _buildButton(String title, Function()? onPressed,
      {ButtonStyle? style}) {
    return FilledButton(
      onPressed: onPressed,
      style: style,
      child: Text(
        title,
      ),
    );
  }

  _buildAddForm() async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Client'),
          content: SingleChildScrollView(
            child: SizedBox(
              width: 30.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 5.h,
                    child: DropdownButtonFormField2(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                          label: Text("Client type")),
                      items: const [
                        DropdownMenuItem(
                          value: 1,
                          child: Text("Test 1"),
                        ),
                        DropdownMenuItem(
                          value: 2,
                          child: Text("Test 2"),
                        ),
                        DropdownMenuItem(
                          value: 3,
                          child: Text("Test 3"),
                        ),
                        DropdownMenuItem(
                          value: 4,
                          child: Text("Test 4"),
                        ),
                      ],
                      onChanged: (value) {},
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 5.h,
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: const Text("First Name"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 5.h,
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: const Text("Last Name"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 5.h,
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: const Text("Other Name"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 5.h,
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: const Text("Telephone"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 5.h,
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: const Text("Email"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 5.h,
                    child: DropdownButtonFormField2(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                          label: Text("Nationality")),
                      items: const [
                        DropdownMenuItem(
                          value: 1,
                          child: Text("Test 1"),
                        ),
                        DropdownMenuItem(
                          value: 2,
                          child: Text("Test 2"),
                        ),
                        DropdownMenuItem(
                          value: 3,
                          child: Text("Test 3"),
                        ),
                        DropdownMenuItem(
                          value: 4,
                          child: Text("Test 4"),
                        ),
                      ],
                      onChanged: (value) {},
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 5.h,
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: const Text("Address"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            FilledButton(
              style: const ButtonStyle(
                minimumSize: MaterialStatePropertyAll(
                  Size(double.infinity, 50),
                ),
              ),
              child: const Text('Submit'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildLayoutBuilder();
  }

  @override
  void initState() {
    super.initState();

    _sortColumnName = "";
    _sortAscending = false;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!_willSearch) {
        if (_latestTick != null && timer.tick > _latestTick!) {
          _willSearch = true;
        }
      }
      if (_willSearch) {
        _willSearch = false;
        _latestTick = null;
        setState(() {
          if (_filterTexts != null && _filterTexts!.isNotEmpty) {
            _filterTexts = _filterTexts;
            print('filterTexts = $_filterTexts');
          }
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
    _timer = null;
  }
}
