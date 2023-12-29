import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_loans/config/responsive.dart';
import 'package:smart_loans/global_values.dart';
import 'package:smart_loans/widgets/dialog_title_wdiget.dart';

class DisbursementForm extends StatelessWidget {
  const DisbursementForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: (Responsive.isDesktop(context)) ? 25.w : 40.w,
        child: Column(
          children: [
            const DialogTitleWidget(text: 'Loan Disbursement Form'),
            _buildAddForm(context),
          ],
        ),
      ),
    );
  }

  Widget _buildAddForm(BuildContext context) {
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
                width: 18.h,
                child: TextFormField(
                  decoration: InputDecoration(
                    label: const Text("Unknown Field 1"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(circularRadius),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
                width: 18.h,
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
