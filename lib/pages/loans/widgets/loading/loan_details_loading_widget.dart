import 'package:flutter/cupertino.dart';

class LoanDetailsLoadingWidget extends StatelessWidget {
  const LoanDetailsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CupertinoActivityIndicator(radius: 20),
    );
  }
}
