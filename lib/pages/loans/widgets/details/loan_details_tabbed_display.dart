import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_loans/pages/loans/widgets/details/tabs/loan_collaterals_table.dart';
import 'package:smart_loans/pages/loans/widgets/details/tabs/loan_disbursements_table.dart';
import 'package:smart_loans/pages/loans/widgets/details/tabs/loan_documents_table.dart';
import 'package:smart_loans/pages/loans/widgets/details/tabs/loan_guarantors_table.dart';
import 'package:smart_loans/pages/loans/widgets/details/tabs/loan_payments_table.dart';

import 'tabs/loan_schedules_table.dart';

class LoanDetailsTabbedDisplay extends StatelessWidget {
  const LoanDetailsTabbedDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return DefaultTabController(
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
          child: const TabBarView(
            children: [
              LoanSchedulesTable(),
              LoanPaymentsTable(),
              LoanCollateralsTable(),
              LoanDocumentsTable(),
              LoanGuarantorsTable(),
              LoanDisbursementsTable(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Not yet implemented", style: TextStyle(fontSize: 18)),
                  Text("Loan comments appear here"),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
