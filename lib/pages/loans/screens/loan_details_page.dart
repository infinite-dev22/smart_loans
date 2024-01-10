import 'package:flutter/material.dart';
import 'package:smart_loans/data_source/models/loan_model.dart';
import 'package:smart_loans/pages/loans/screens/layouts/loans_details_page_layout.dart';
import 'package:smart_loans/widgets/custom_scaffold.dart';

class LoanDetailsPage extends StatelessWidget {
  const LoanDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var loanId = ModalRoute.of(context)!.settings.arguments as int;
    return CustomScaffold(
      route: "/loan",
      body: LoanDetailsPageLayout(loanId: loanId),
    );
  }
}
