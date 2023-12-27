import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'loan_schedules_table.dart';

class LoanDetailsTabbedDisplay extends StatelessWidget {
  const LoanDetailsTabbedDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return
      DefaultTabController(
        length: 7,
        child: _buildTabs(),
      );
  }

  Widget _buildTabs() {
    return Column(
      children: [
        const TabBar(
          tabs: [
            Tab(
              child: Text("Loan Schedules"),
            ),
            Tab(
              child: Text("Payments"),
            ),
            Tab(
              child: Text("Loan Collateral"),
            ),
            Tab(
              child: Text("Loan Documents"),
            ),
            Tab(
              child: Text("Guarantor"),
            ),
            Tab(
              child: Text("Disbursements"),
            ),
            Tab(
              child: Text("Loan Comments"),
            ),
          ],
        ),
        SizedBox(
          height: 70.h,
          child: TabBarView(
            children: [
              LoanSchedulesTable(),
              const Icon(Icons.directions_transit),
              const Icon(Icons.directions_bike),
              const Icon(Icons.directions_bike),
              const Icon(Icons.directions_bike),
              const Icon(Icons.directions_bike),
              const Icon(Icons.directions_bike),
            ],
          ),
        ),
      ],
    );
  }
}
