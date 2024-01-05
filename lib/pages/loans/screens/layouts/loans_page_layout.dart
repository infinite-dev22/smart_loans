import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_loans/pages/loans/bloc/loan_bloc.dart';
import 'package:smart_loans/pages/loans/widgets/error/loans_error_widget.dart';
import 'package:smart_loans/pages/loans/widgets/initial/loan_details_error_widget.dart';
import 'package:smart_loans/pages/loans/widgets/loading/loans_loading_widget.dart';
import 'package:smart_loans/pages/loans/widgets/success/loans_success_widget.dart';

class LoansPageLayout extends StatefulWidget {
  const LoansPageLayout({super.key});

  @override
  State<LoansPageLayout> createState() => _LoansPageLayoutState();
}

class _LoansPageLayoutState extends State<LoansPageLayout> {
  final loansBloc = LoanBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoanBloc, LoanState>(
      bloc: LoanBloc(),
      builder: (context, state) {
        if (state is LoansInitial) {
          context.read<LoanBloc>().add(GetLoans());
        } else if (state is LoansSuccess) {
          return const LoansSuccessWidget();
        } else if (state is LoansLoading) {
          return const LoansLoadingWidget();
        } else if (state is LoansError) {
          return const LoansErrorWidget();
        } else if (state is LoanNoData) {
          return const LoansInitialWidget();
        }
        return const LoansInitialWidget();
      },
    );
  }

  @override
  void dispose() {
    super.dispose();

    loansBloc.close();
  }
}
