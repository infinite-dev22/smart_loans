import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_loans/pages/loan_schedules/bloc/loan_schedule_bloc.dart';
import 'package:smart_loans/pages/loans/widgets/details/tabs/loan_collaterals_table.dart';
import 'package:smart_loans/pages/loans/widgets/details/tabs/loan_disbursements_table.dart';
import 'package:smart_loans/pages/loans/widgets/details/tabs/loan_documents_table.dart';
import 'package:smart_loans/pages/loans/widgets/details/tabs/loan_guarantors_table.dart';
import 'package:smart_loans/pages/loans/widgets/details/tabs/loan_payments_table.dart';
import 'package:smart_loans/pages/loans/widgets/details/tabs/loan_schedules/loan_schedules_error_widget.dart';
import 'package:smart_loans/pages/loans/widgets/details/tabs/loan_schedules/loan_schedules_initial_widget.dart';
import 'package:smart_loans/pages/loans/widgets/details/tabs/loan_schedules/loan_schedules_loading_widget.dart';

import 'tabs/loan_schedules/loan_schedules_table.dart';

class LoanDetailsTabbedDisplay extends StatelessWidget {
  final int loanId;

  const LoanDetailsTabbedDisplay({super.key, required this.loanId});

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: _buildTabs(context),
    );
  }

  Widget _buildTabs(BuildContext context) {
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
              _buildLoanScheduleWidgets(context),
              const LoanPaymentsTable(),
              const LoanCollateralsTable(),
              const LoanDocumentsTable(),
              const LoanGuarantorsTable(),
              const LoanDisbursementsTable(),
              const Column(
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

  Widget _buildLoanScheduleWidgets(BuildContext context) {
    context.read<LoanScheduleBloc>().add(GetLoanSchedules(loanId));
    return BlocBuilder<LoanScheduleBloc, LoanScheduleState>(
      builder: (context, state) {
        if (state.status == LoanScheduleStatus.initial) {
          context.read<LoanScheduleBloc>().add(GetLoanSchedules(state.loanId!));
        } else if (state.status == LoanScheduleStatus.success) {
          return SingleChildScrollView(
            child: LoanSchedulesTable(),
          );
        } else if (state.status == LoanScheduleStatus.loading) {
          return const LoanSchedulesLoadingWidget();
        } else if (state.status == LoanScheduleStatus.error) {
          return const LoanSchedulesErrorWidget();
        }
        return const LoanSchedulesInitialWidget();
      },
    );
  }
}
