import 'package:flutter/material.dart';
import 'package:profile_photo/profile_photo.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_loans/config/responsive.dart';
import 'package:smart_loans/global_values.dart';
import 'package:smart_loans/pages/loans/widgets/details/loan_officer_widget.dart';
import 'package:smart_loans/pages/loans/widgets/details/loan_summary_widget.dart';
import 'package:smart_loans/theme/colors.dart';

import 'loan_details_tabbed_display.dart';

class LoanDetailSuccessWidget extends StatefulWidget {
  const LoanDetailSuccessWidget({super.key});

  @override
  State<LoanDetailSuccessWidget> createState() =>
      _LoanDetailSuccessWidgetState();
}

class _LoanDetailSuccessWidgetState extends State<LoanDetailSuccessWidget> {
  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          child: SizedBox(
            width: 67.w,
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
                          "Loan Details",
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProfilePhoto(
                            totalWidth: 10.h,
                            color: AppColor.white45,
                          ),
                          SizedBox(width: 1.w),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Loan No.: "),
                              Text("Client Name: "),
                              Text("Client No.: "),
                              Text("Address: "),
                              Text("Loan Status: "),
                              Text("Flow Type: "),
                            ],
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "0000001",
                                style: TextStyle(
                                  color: AppColor.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Vicent Company",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "12295200000",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Kampala",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "APPROVED (4.12.2023)",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "LV2",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Loan Type: "),
                              Text("Principal: "),
                              Text("Loan Fee: "),
                              Text("Loan Interest: "),
                              Text("Loan Duration: "),
                              Text("Repayment Cycle: "),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Business",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "UGX 2,000,000",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "UGX 200,000",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "UGX 100,000",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "10 Months",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Monthly",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          if (Responsive.isDesktop(context))
                            FilledButton(
                              onPressed: () {},
                              child: const Text("Edit Interest"),
                            ),
                          SizedBox(width: 1.w),
                          FilledButton(
                            onPressed: () {},
                            child: const Text("Process Loan"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const LoanDetailsTabbedDisplay(),
              ],
            ),
          ),
        ),
        SizedBox(width: 1.w),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.all(padding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FilledButton(
                    onPressed: () {},
                    child: const Text("Edit Loan"),
                  ),
                  SizedBox(width: 1.w),
                  FilledButton(
                    onPressed: () {},
                    child: const Text("List"),
                  ),
                  SizedBox(width: 1.w),
                  FilledButton(
                    onPressed: () {},
                    child: const Text("Add Loan"),
                  ),
                  SizedBox(width: 1.w),
                ],
              ),
            ),
            const LoanOfficerWidget(),
            SizedBox(height: 2.h),
            const LoanSummaryWidget(),
          ],
        ),
      ],
    );
  }
}
