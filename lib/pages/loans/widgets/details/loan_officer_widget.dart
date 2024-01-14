import 'package:flutter/material.dart';
import 'package:profile_photo/profile_photo.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_loans/global_values.dart';
import 'package:smart_loans/theme/colors.dart';

class LoanOfficerWidget extends StatelessWidget {
  final double? width;

  const LoanOfficerWidget({
    super.key,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: width,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColor.primary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(circularRadius),
                  topRight: Radius.circular(circularRadius),
                ),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(padding),
                    child: const Text(
                      "Loans Officer",
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColor.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(padding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProfilePhoto(
                    totalWidth: 5.h,
                    color: AppColor.white45,
                  ),
                  const Text("Valeria Konarld"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
