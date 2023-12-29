import 'package:flutter/cupertino.dart';
import 'package:smart_loans/theme/colors.dart';

class ClientsErrorWidget extends StatelessWidget {
  const ClientsErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "An error occurred while loading clients",
        style: TextStyle(color: AppColor.red),
      ),
    );
  }
}
