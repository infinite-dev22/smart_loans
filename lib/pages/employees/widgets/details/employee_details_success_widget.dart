import 'package:flutter/material.dart';
import 'package:profile_photo/profile_photo.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_loans/global_values.dart';
import 'package:smart_loans/theme/colors.dart';

class EmployeeDetailsSuccessWidget extends StatefulWidget {
  const EmployeeDetailsSuccessWidget({super.key});

  @override
  State<EmployeeDetailsSuccessWidget> createState() =>
      _EmployeeDetailsSuccessWidgetState();
}

class _EmployeeDetailsSuccessWidgetState
    extends State<EmployeeDetailsSuccessWidget> {
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
            width: 60.w,
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
                          "Employees Details",
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
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProfilePhoto(
                            totalWidth: 5.h,
                            color: AppColor.white45,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildTitle(
                                "Vicent Company",
                              ),
                              _buildSubTitle("Individual"),
                              const Text("I-231204-0001"),
                              const Text("12295200000"),
                            ],
                          ),
                        ],
                      ),
                      FilledButton(
                        onPressed: () {},
                        child: const Text("Add Image"),
                      ),
                    ],
                  ),
                ),
                DefaultTabController(
                  length: 5,
                  child: _buildTabs(),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 20),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FilledButton(
                    onPressed: () {},
                    child: const Text("Edit Client"),
                  ),
                  SizedBox(width: 1.w),
                  FilledButton(
                    onPressed: () {},
                    child: const Text("List"),
                  ),
                  SizedBox(width: 1.w),
                  FilledButton(
                    onPressed: () {},
                    child: const Text("Convert"),
                  ),
                  SizedBox(width: 1.w),
                  FilledButton(
                    onPressed: () {},
                    child: const Text("Add Client"),
                  ),
                  SizedBox(width: 1.w),
                ],
              ),
            ),
            Card(
              child: SizedBox(
                width: 25.w,
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
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTitle(String data) {
    return Text(
      data,
      style: TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildSubTitle(String data) {
    return Text(
      data,
      style: TextStyle(
        fontSize: 10.sp,
        fontWeight: FontWeight.w100,
        fontStyle: FontStyle.italic,
      ),
    );
  }

  Widget _buildTabs() {
    return Column(
      children: [
        const TabBar(
          tabs: [
            Tab(
              child: Text("More Details"),
            ),
            Tab(
              child: Text("Documents"),
            ),
            Tab(
              child: Text("Loans"),
            ),
            Tab(
              child: Text("Next of Kin"),
            ),
            Tab(
              child: Text("Guarantor"),
            ),
          ],
        ),
        SizedBox(
          width: 55.w,
          height: 72.h,
          child: const TabBarView(
            children: [
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
              Icon(Icons.directions_bike),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ],
    );
  }
}
