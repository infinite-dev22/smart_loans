import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_loans/pages/loans/bloc/loan_bloc.dart';
import 'package:smart_loans/pages/loans/widgets/error/loans_error_widget.dart';
import 'package:smart_loans/pages/loans/widgets/initial/loan_details_error_widget.dart';
import 'package:smart_loans/pages/loans/widgets/loading/loans_loading_widget.dart';
import 'package:smart_loans/pages/loans/widgets/success/loans_success_widget.dart';
import 'package:smart_loans/widgets/custom_scaffold.dart';

class LoansPage extends StatefulWidget {
  const LoansPage({super.key});

 @override
  State<LoansPage> createState() => _LoansPageState();
}


class _LoansPageState extends State<LoansPage> {
    final loansBloc = LoanBloc();

  @override
 Widget build(BuildContext context) {
    return CustomScaffold(
      route: "loans",
      body: BlocBuilder<LoanBloc, LoanState>(
        bloc: loansBloc, // Use the instance you created instead of the class
        builder: (context, state) {
          if (state is LoansSuccess) {
            return const LoansSuccessWidget();
          } else if (state is LoansLoading) {
            return const LoansLoadingWidget();
          } else if (state is LoansError) {
            return const LoansErrorWidget();
          } else if (state is LoanNoData) {
            return const LoansInitialWidget();
          } else {
            // For now let's just show the data screen as an initial screen.
            // return const LoansSuccessWidget();
            return const LoansSuccessWidget();
          }
        },
      ),
    );
  }

    @override
  void dispose() {
    super.dispose();

    loansBloc.close();
  }
}
