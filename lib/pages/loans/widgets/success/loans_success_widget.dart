import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_data_table/web_data_table.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_loans/config/responsive.dart';
import 'package:smart_loans/data_source/models/loan_model.dart';
import 'package:smart_loans/global_values.dart';
import 'package:smart_loans/pages/branches/bloc/branch_bloc.dart';
import 'package:smart_loans/pages/clients/bloc/clients_bloc/clients_bloc.dart';
import 'package:smart_loans/pages/currencies/bloc/currency_bloc.dart';
import 'package:smart_loans/pages/loan_category/bloc/loan_category_bloc.dart';
import 'package:smart_loans/pages/loan_type/bloc/loan_type_bloc.dart';
import 'package:smart_loans/pages/loans/bloc/forms/loans/loan_form_bloc.dart';
import 'package:smart_loans/pages/loans/widgets/details/forms/loan_form.dart';

import '../../bloc/loan_bloc.dart';

class LoansSuccessWidget extends StatefulWidget {
  const LoansSuccessWidget({super.key});

  @override
  State<LoansSuccessWidget> createState() => _LoansTableWidgetState();
}

class _LoansTableWidgetState extends State<LoansSuccessWidget> {
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
            header: const Text('Loans'),
            actions: _buildActions,
            dataRowHeight: 40,
            headingRowHeight: 50,
            columnSpacing: 0,
            source: WebDataTableSource(
              sortColumnName: _sortColumnName,
              sortAscending: _sortAscending,
              filterTexts: _filterTexts,
              columns: [
                WebDataColumn(
                  name: 'client_name',
                  label: const Text('Client'),
                  dataCell: (value) => DataCell(Text('$value')),
                ),
                WebDataColumn(
                  name: 'principal_amount',
                  label: const Text('Principal Amount'),
                  dataCell: (value) => DataCell(Text('$value')),
                ),
                WebDataColumn(
                  name: 'loan_fees',
                  label: const Text('Loan Fees'),
                  dataCell: (value) => DataCell(Text('$value')),
                ),
                WebDataColumn(
                  name: 'loan_type_name',
                  label: const Text('Loan Fees Type'),
                  dataCell: (value) => DataCell(Text('$value')),
                ),
                WebDataColumn(
                  name: 'loan_category_name',
                  label: const Text('Loan Category'),
                  dataCell: (value) => DataCell(Text('$value')),
                ),
                WebDataColumn(
                  name: 'branch_name',
                  label: const Text('Branch'),
                  dataCell: (value) => DataCell(Text('$value')),
                ),
                WebDataColumn(
                  name: 'loan_status_name',
                  label: const Text('Loan Status'),
                  dataCell: (value) => DataCell(Text('$value')),
                ),
              ],
              rows: context
                  .read<LoanBloc>()
                  .state
                  .loans!
                  .map((e) => e.toViewJson())
                  .toList(),
              selectedRowKeys: _selectedRowKeys,
              onTapRow: (rows, index) {
                var loan = LoanModel.fromJsonToView(rows[index]);
                Navigator.pushNamed(context, "/loan", arguments: loan.id);
              },
              onSelectRows: (keys) {
                setState(() {
                  _selectedRowKeys = keys;
                });
              },
              primaryKeyName: 'client_id',
            ),
            horizontalMargin: 10,
            onPageChanged: (offset) {},
            onSort: (columnName, ascending) {
              setState(() {
                _sortColumnName = columnName;
                _sortAscending = ascending;
              });
            },
            onRowsPerPageChanged: (rowsPerPage) {
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
        width: 30.w,
        height: 50,
        child: TextFormField(
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            hintText: "Search loans",
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
      if (!Responsive.isMobile(context)) _buildButton("Copy", () {}),
      _buildButton("Export", () {}),
      if (!Responsive.isMobile(context)) _buildButton("Filter", () {}),
      _buildButton("Add", () async {
        _buildLoanAddDialog();
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

  _buildLoanAddDialog() async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext childContext) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(circularRadius),
          ),
          child: MultiBlocProvider(providers: [
            BlocProvider<LoanBloc>(
              create: (_) => LoanBloc(),
            ),
            BlocProvider<LoanFormBloc>(
              create: (_) => LoanFormBloc(),
            ),
            BlocProvider<ClientsBloc>(
              create: (_) => ClientsBloc(),
            ),
            BlocProvider<LoanTypeBloc>(
              create: (_) => LoanTypeBloc(),
            ),
            BlocProvider<LoanCategoryBloc>(
              create: (_) => LoanCategoryBloc(),
            ),
            BlocProvider<BranchBloc>(
              create: (_) => BranchBloc(),
            ),
            BlocProvider<CurrencyBloc>(
              create: (_) => CurrencyBloc(),
            ),
          ], child: LoanForm(parentContext: context)),
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

    _sortColumnName = "*";
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
            if (kDebugMode) {
              print('filterTexts = $_filterTexts');
            }
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
