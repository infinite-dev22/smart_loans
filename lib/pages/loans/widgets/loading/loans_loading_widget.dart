import 'package:flutter/cupertino.dart';

class LoansLoadingWidget extends StatelessWidget {
  const LoansLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CupertinoActivityIndicator(radius: 20),
    );
  }
}
