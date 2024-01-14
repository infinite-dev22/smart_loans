import 'package:flutter/cupertino.dart';

class LoanPaymentsLoadingWidget extends StatelessWidget {
  const LoanPaymentsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CupertinoActivityIndicator(radius: 20),
    );
  }
}
