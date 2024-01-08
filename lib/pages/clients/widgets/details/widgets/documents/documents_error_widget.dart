import 'package:flutter/cupertino.dart';
import 'package:smart_loans/theme/colors.dart';

class DocumentsErrorWidget extends StatelessWidget {
  const DocumentsErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "An error occurred while loading loan documents",
        style: TextStyle(color: AppColor.red),
      ),
    );
  }
}
