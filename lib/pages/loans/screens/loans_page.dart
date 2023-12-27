import 'package:flutter/material.dart';
import 'package:smart_loans/pages/loans/widgets/success/loans_success_widget.dart';
import 'package:smart_loans/widgets/custom_scaffold.dart';

class LoansPage extends StatelessWidget {
  const LoansPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      route: "/loans",
      body: LoansSuccessWidget(),
    );
  }
}
