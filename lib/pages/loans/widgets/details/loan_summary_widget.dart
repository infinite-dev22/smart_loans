import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_loans/config/responsive.dart';
import 'package:smart_loans/global_values.dart';
import 'package:smart_loans/theme/colors.dart';

class LoanSummaryWidget extends StatelessWidget {
  const LoanSummaryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: (Responsive.isDesktop(context))
            ? 16.w
            : (Responsive.isTablet(context))
                ? 75.w
                : (Responsive.isMobile(context))
                    ? 95.w
                    : 100.w,
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
                      "Loans Summary",
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
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Loan No.: "),
                      Text("Created: "),
                      Text("Released: "),
                      Text("Maturity: "),
                      Text("Principal: "),
                      Text("Loan Rate: "),
                      Text("Loan Fees: "),
                      Text("Paid: "),
                      Text("Balance: "),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "00000011",
                        style: TextStyle(
                          color: AppColor.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "4.12.2023",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "4.12.2023",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "4.10.2024",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "UGX 2,000,000/=",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "UGX 100,000/=",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "UGX 200,000 /=",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "UGX 0/=",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "UGX 3,000,000/=",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
