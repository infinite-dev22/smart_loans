import 'package:flutter/cupertino.dart';
import 'package:smart_loans/global_values.dart';
import 'package:smart_loans/theme/colors.dart';

class TitleBarWithActions extends StatelessWidget {
  final String title;
  final List<Widget>? actions;

  const TitleBarWithActions({
    super.key,
    required this.title,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.all(padding),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              color: AppColor.white,
            ),
          ),
        ),
        Row(
          children: actions ?? [],
        )
      ],
    );
  }
}
