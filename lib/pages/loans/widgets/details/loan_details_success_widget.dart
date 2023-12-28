import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:profile_photo/profile_photo.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_loans/config/responsive.dart';
import 'package:smart_loans/global_values.dart';
import 'package:smart_loans/pages/loans/widgets/details/loan_officer_widget.dart';
import 'package:smart_loans/pages/loans/widgets/details/loan_summary_widget.dart';
import 'package:smart_loans/theme/colors.dart';
import 'package:smart_loans/widgets/dialog_title_wdiget.dart';

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
                              onPressed: _buildInterestForm,
                              child: const Text("Edit Interest"),
                            ),
                          SizedBox(width: 1.w),
                          FilledButton(
                            onPressed: _buildProcessDialog,
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
                    onPressed: _buildAddDialog,
                    child: const Text("Edit Loan"),
                  ),
                  SizedBox(width: 1.w),
                  FilledButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/loans");
                    },
                    child: const Text("List"),
                  ),
                  SizedBox(width: 1.w),
                  FilledButton(
                    onPressed: _buildAddDialog,
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

  _buildInterestForm() async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(circularRadius),
          ),
          child: SingleChildScrollView(
            child: SizedBox(
              width: 25.w,
              child: Column(
                children: [
                  const DialogTitleWidget(text: 'Edit Interest'),
                  Padding(
                    padding: EdgeInsets.all(padding),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5.h,
                          child: DropdownButtonFormField2(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                ),
                                label: Text("Interest Method")),
                            items: const [
                              DropdownMenuItem(
                                value: 1,
                                child: Text("Test 1"),
                              ),
                              DropdownMenuItem(
                                value: 2,
                                child: Text("Test 2"),
                              ),
                              DropdownMenuItem(
                                value: 3,
                                child: Text("Test 3"),
                              ),
                              DropdownMenuItem(
                                value: 4,
                                child: Text("Test 4"),
                              ),
                            ],
                            onChanged: (value) {},
                          ),
                        ),
                        SizedBox(height: 1.h),
                        SizedBox(
                          height: 5.h,
                          child: DropdownButtonFormField2(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                ),
                                label: Text("Interest Period")),
                            items: const [
                              DropdownMenuItem(
                                value: 1,
                                child: Text("Test 1"),
                              ),
                              DropdownMenuItem(
                                value: 2,
                                child: Text("Test 2"),
                              ),
                              DropdownMenuItem(
                                value: 3,
                                child: Text("Test 3"),
                              ),
                              DropdownMenuItem(
                                value: 4,
                                child: Text("Test 4"),
                              ),
                            ],
                            onChanged: (value) {},
                          ),
                        ),
                        SizedBox(height: 1.h),
                        SizedBox(
                          height: 5.h,
                          child: DropdownButtonFormField2(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                ),
                                label: Text("Repayment Cycle")),
                            items: const [
                              DropdownMenuItem(
                                value: 1,
                                child: Text("Test 1"),
                              ),
                              DropdownMenuItem(
                                value: 2,
                                child: Text("Test 2"),
                              ),
                              DropdownMenuItem(
                                value: 3,
                                child: Text("Test 3"),
                              ),
                              DropdownMenuItem(
                                value: 4,
                                child: Text("Test 4"),
                              ),
                            ],
                            onChanged: (value) {},
                          ),
                        ),
                        SizedBox(height: 1.h),
                        SizedBox(
                          height: 5.h,
                          child: DropdownButtonFormField2(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                ),
                                label: Text("Loan Duration Type")),
                            items: const [
                              DropdownMenuItem(
                                value: 1,
                                child: Text("Test 1"),
                              ),
                              DropdownMenuItem(
                                value: 2,
                                child: Text("Test 2"),
                              ),
                              DropdownMenuItem(
                                value: 3,
                                child: Text("Test 3"),
                              ),
                              DropdownMenuItem(
                                value: 4,
                                child: Text("Test 4"),
                              ),
                            ],
                            onChanged: (value) {},
                          ),
                        ),
                        SizedBox(height: 1.h),
                        SizedBox(
                          width: double.infinity,
                          height: 5.h,
                          child: TextFormField(
                            decoration: InputDecoration(
                              label: const Text("Loan Duration"),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 1.h),
                        SizedBox(
                          height: 5.h,
                          child: DropdownButtonFormField2(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                ),
                                label: Text("Interest Type")),
                            items: const [
                              DropdownMenuItem(
                                value: 1,
                                child: Text("Test 1"),
                              ),
                              DropdownMenuItem(
                                value: 2,
                                child: Text("Test 2"),
                              ),
                              DropdownMenuItem(
                                value: 3,
                                child: Text("Test 3"),
                              ),
                              DropdownMenuItem(
                                value: 4,
                                child: Text("Test 4"),
                              ),
                            ],
                            onChanged: (value) {},
                          ),
                        ),
                        SizedBox(height: 1.h),
                        Row(
                          children: [
                            SizedBox(
                              width: 21.3.h,
                              height: 5.h,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  label: const Text("Interest Percentage"),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 1.w),
                            SizedBox(
                              width: 21.3.h,
                              height: 5.h,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  label: const Text("Interest Amount"),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 1.h),
                        SizedBox(
                          height: 5.h,
                          child: TextFormField(
                            decoration: InputDecoration(
                              label: const Text("Installments"),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 2.h),
                        FilledButton(
                          style: const ButtonStyle(
                            minimumSize: MaterialStatePropertyAll(
                              Size(double.infinity, 50),
                            ),
                          ),
                          child: const Text('Submit'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  _buildProcessDialog() async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(circularRadius),
          ),
          child: SingleChildScrollView(
            child: SizedBox(
              width: 25.w,
              child: Column(
                children: [
                  const DialogTitleWidget(text: 'Process Loan'),
                  Padding(
                    padding: EdgeInsets.all(padding),
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 5.h,
                          child: TextFormField(
                            decoration: InputDecoration(
                              label: const Text("Comment"),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Row(
                          mainAxisAlignment: (Responsive.isDesktop(context))
                              ? MainAxisAlignment.end
                              : MainAxisAlignment.spaceBetween,
                          children: [
                            OutlinedButton(
                              style: const ButtonStyle(
                                foregroundColor:
                                    MaterialStatePropertyAll(AppColor.red),
                                side: MaterialStatePropertyAll(
                                    BorderSide(color: AppColor.red)),
                              ),
                              child: const Text('Reject',
                                  style:
                                      TextStyle(fontWeight: FontWeight.w600)),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            SizedBox(width: 1.w),
                            FilledButton(
                              child: const Text('Approve'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  _buildAddDialog() async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(circularRadius),
          ),
          child: SingleChildScrollView(
            child: SizedBox(
              width: 25.w,
              child: Column(
                children: [
                  const DialogTitleWidget(text: 'Interest Form'),
                  _buildAddForm(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAddForm() {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Column(
        children: [
          SizedBox(
            height: 5.h,
            child: DropdownButtonFormField2(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(circularRadius),
                    ),
                  ),
                  label: const Text("Client")),
              items: const [
                DropdownMenuItem(
                  value: 1,
                  child: Text("Test 1"),
                ),
                DropdownMenuItem(
                  value: 2,
                  child: Text("Test 2"),
                ),
                DropdownMenuItem(
                  value: 3,
                  child: Text("Test 3"),
                ),
                DropdownMenuItem(
                  value: 4,
                  child: Text("Test 4"),
                ),
              ],
              onChanged: (value) {},
            ),
          ),
          SizedBox(height: 1.h),
          SizedBox(
            height: 5.h,
            child: DropdownButtonFormField2(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(circularRadius),
                    ),
                  ),
                  label: const Text("Loan type")),
              items: const [
                DropdownMenuItem(
                  value: 1,
                  child: Text("Test 1"),
                ),
                DropdownMenuItem(
                  value: 2,
                  child: Text("Test 2"),
                ),
                DropdownMenuItem(
                  value: 3,
                  child: Text("Test 3"),
                ),
                DropdownMenuItem(
                  value: 4,
                  child: Text("Test 4"),
                ),
              ],
              onChanged: (value) {},
            ),
          ),
          SizedBox(height: 1.h),
          SizedBox(
            height: 5.h,
            child: DropdownButtonFormField2(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(circularRadius),
                    ),
                  ),
                  label: const Text("Loan category")),
              items: const [
                DropdownMenuItem(
                  value: 1,
                  child: Text("Test 1"),
                ),
                DropdownMenuItem(
                  value: 2,
                  child: Text("Test 2"),
                ),
                DropdownMenuItem(
                  value: 3,
                  child: Text("Test 3"),
                ),
                DropdownMenuItem(
                  value: 4,
                  child: Text("Test 4"),
                ),
              ],
              onChanged: (value) {},
            ),
          ),
          SizedBox(height: 1.h),
          SizedBox(
            height: 5.h,
            child: DropdownButtonFormField2(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(circularRadius),
                    ),
                  ),
                  label: const Text("Branch")),
              items: const [
                DropdownMenuItem(
                  value: 1,
                  child: Text("Test 1"),
                ),
                DropdownMenuItem(
                  value: 2,
                  child: Text("Test 2"),
                ),
                DropdownMenuItem(
                  value: 3,
                  child: Text("Test 3"),
                ),
                DropdownMenuItem(
                  value: 4,
                  child: Text("Test 4"),
                ),
              ],
              onChanged: (value) {},
            ),
          ),
          SizedBox(height: 1.h),
          SizedBox(
            height: 5.h,
            child: TextFormField(
              decoration: InputDecoration(
                label: const Text("Description"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(circularRadius),
                ),
              ),
            ),
          ),
          SizedBox(height: 1.h),
          SizedBox(
            height: 5.h,
            child: DropdownButtonFormField2(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(circularRadius),
                    ),
                  ),
                  label: const Text("Currency")),
              items: const [
                DropdownMenuItem(
                  value: 1,
                  child: Text("Test 1"),
                ),
                DropdownMenuItem(
                  value: 2,
                  child: Text("Test 2"),
                ),
                DropdownMenuItem(
                  value: 3,
                  child: Text("Test 3"),
                ),
                DropdownMenuItem(
                  value: 4,
                  child: Text("Test 4"),
                ),
              ],
              onChanged: (value) {},
            ),
          ),
          SizedBox(height: 1.h),
          SizedBox(
            height: 5.h,
            child: TextFormField(
              decoration: InputDecoration(
                label: const Text("Principal Amount"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(circularRadius),
                ),
              ),
            ),
          ),
          SizedBox(height: 1.h),
          SizedBox(
            height: 5.h,
            child: DropdownButtonFormField2(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(circularRadius),
                    ),
                  ),
                  label: const Text("Loan Fees")),
              items: const [
                DropdownMenuItem(
                  value: 1,
                  child: Text("Fixed Rate"),
                ),
                DropdownMenuItem(
                  value: 2,
                  child: Text("Percentage"),
                ),
              ],
              onChanged: (value) {},
            ),
          ),
          SizedBox(height: 1.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 5.h,
                width: 11.5.w,
                child: TextFormField(
                  decoration: InputDecoration(
                    label: const Text("Unknown Field 1"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(circularRadius),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 1.w),
              SizedBox(
                height: 5.h,
                width: 11.5.w,
                child: TextFormField(
                  decoration: InputDecoration(
                    label: const Text("Unknown Field 2"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(circularRadius),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 2.h),
          FilledButton(
            style: const ButtonStyle(
              minimumSize: MaterialStatePropertyAll(
                Size(double.infinity, 50),
              ),
            ),
            child: const Text('Submit'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
