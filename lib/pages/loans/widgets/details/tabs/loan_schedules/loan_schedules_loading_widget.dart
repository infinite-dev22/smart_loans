import 'package:flutter/cupertino.dart';

class LoanSchedulesLoadingWidget extends StatelessWidget {
  const LoanSchedulesLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CupertinoActivityIndicator(radius: 20),
    );
  }
}
