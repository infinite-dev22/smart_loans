import 'package:flutter/cupertino.dart';
import 'package:smart_loans/theme/colors.dart';

class ClientDetailsLoadingWidget extends StatelessWidget {
  const ClientDetailsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "An error occurred while loading client details",
          style: TextStyle(color: AppColor.red),
        ),
      ],
    );
  }
}
