import 'package:flutter/cupertino.dart';

class EmployeeDetailsLoadingWidget extends StatelessWidget {
  const EmployeeDetailsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CupertinoActivityIndicator(radius: 20),
    );
  }
}
