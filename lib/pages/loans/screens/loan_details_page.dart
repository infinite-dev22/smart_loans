import 'package:flutter/material.dart';
import 'package:smart_loans/pages/loans/widgets/details/loan_details_success_widget.dart';
import 'package:smart_loans/widgets/custom_scaffold.dart';

class LoanDetailsPage extends StatelessWidget {
  const LoanDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      route: "/loan",
      body: LoanDetailSuccessWidget(),
    );
  }
}
