import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_loans/config/responsive.dart';
import 'package:smart_loans/global_values.dart';
import 'package:smart_loans/widgets/dialog_title_wdiget.dart';

class EmployeeForm extends StatelessWidget {
  const EmployeeForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: (Responsive.isDesktop(context)) ? 25.w : 40.w,
        child: Column(
          children: [
            const DialogTitleWidget(text: 'Employee Form'),
            Padding(
              padding: EdgeInsets.all(padding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 5.h,
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: const Text("First Name"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 1.h),
                  SizedBox(
                    height: 5.h,
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: const Text("Last Name"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 1.h),
                  SizedBox(
                    height: 5.h,
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: const Text("Other Name"),
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
                          label: Text("Designations")),
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
                          label: Text("Gender")),
                      items: const [
                        DropdownMenuItem(
                          value: 1,
                          child: Text("Male"),
                        ),
                        DropdownMenuItem(
                          value: 2,
                          child: Text("Female"),
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
                        label: const Text("Email"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 1.h),
                  SizedBox(
                    height: 5.h,
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: const Text("Telephone"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 1.h),
                  SizedBox(
                    height: 5.h,
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: const Text("Address"),
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
    );
  }
}
