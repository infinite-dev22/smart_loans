import 'package:flutter/cupertino.dart';

class EmployeesLoadingWidget extends StatelessWidget {
  const EmployeesLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CupertinoActivityIndicator(radius: 20),
    );
  }
}
