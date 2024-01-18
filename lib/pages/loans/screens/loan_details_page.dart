import 'package:flutter/material.dart';
import 'package:smart_loans/init.dart';
import 'package:smart_loans/pages/loans/screens/layouts/loans_details_page_layout.dart';
import 'package:smart_loans/widgets/custom_scaffold.dart';

class LoanDetailsPage extends StatelessWidget {
  const LoanDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    int? loanId;
    if (ModalRoute.of(context)!.settings.arguments != null) {
      loanId = ModalRoute.of(context)!.settings.arguments as int;
      getLocalStorage().write("loan_id", loanId);
    } else {
      loanId = getLocalStorage().read("loan_id");
    }
    return CustomScaffold(
      route: "/loan",
      body: LoanDetailsPageLayout(loanId: loanId!),
    );
  }
}
