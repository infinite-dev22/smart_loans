import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_loans/pages/loan_schedules/bloc/loan_schedule_bloc.dart';
import 'package:smart_loans/pages/loans/widgets/details/tabs/loan_collaterals_table.dart';
import 'package:smart_loans/pages/loans/widgets/details/tabs/loan_disbursements_table.dart';
import 'package:smart_loans/pages/loans/widgets/details/tabs/loan_documents_table.dart';
import 'package:smart_loans/pages/loans/widgets/details/tabs/loan_guarantors_table.dart';
import 'package:smart_loans/pages/loans/widgets/details/tabs/loan_payments/loan_payments_error_widget.dart';
import 'package:smart_loans/pages/loans/widgets/details/tabs/loan_payments/loan_payments_initial_widget.dart';
import 'package:smart_loans/pages/loans/widgets/details/tabs/loan_payments/loan_payments_loading_widget.dart';
import 'package:smart_loans/pages/loans/widgets/details/tabs/loan_payments_table.dart';
import 'package:smart_loans/pages/loans/widgets/details/tabs/loan_schedules/loan_schedules_error_widget.dart';
import 'package:smart_loans/pages/loans/widgets/details/tabs/loan_schedules/loan_schedules_initial_widget.dart';
import 'package:smart_loans/pages/loans/widgets/details/tabs/loan_schedules/loan_schedules_loading_widget.dart';

import '../../../loan_payment/bloc/loan_payment_bloc.dart';
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
              _buildLoanPaymentWidgets(context),
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
    return BlocBuilder<LoanScheduleBloc, LoanScheduleState>(
      builder: (context, state) {
        if (state.status == LoanScheduleStatus.initial) {
          context.read<LoanScheduleBloc>().add(GetLoanSchedules(loanId));
        } else if (state.status == LoanScheduleStatus.success) {
          if (state.loanSchedules!.isNotEmpty) {
            return SingleChildScrollView(
              child: LoanSchedulesTable(),
            );
          }
          if (state.loanSchedules!.isEmpty) {
            return const LoanSchedulesInitialWidget();
          }
        } else if (state.status == LoanScheduleStatus.loading) {
          return const LoanSchedulesLoadingWidget();
        } else if (state.status == LoanScheduleStatus.error) {
          return const LoanSchedulesErrorWidget();
        }
        return const LoanSchedulesInitialWidget();
      },
    );
  }

  Widget _buildLoanPaymentWidgets(BuildContext context) {
    return BlocBuilder<LoanPaymentBloc, LoanPaymentState>(
      builder: (context, state) {
        if (state.status == LoanPaymentStatus.initial) {
          context.read<LoanPaymentBloc>().add(GetLoanPayments(loanId));
        } else if (state.status == LoanPaymentStatus.success) {
          return const SingleChildScrollView(
            child: LoanPaymentsTable(),
          );
        } else if (state.status == LoanPaymentStatus.loading) {
          return const LoanPaymentsLoadingWidget();
        } else if (state.status == LoanPaymentStatus.error) {
          return const LoanPaymentsErrorWidget();
        }
        return const LoanPaymentsInitialWidget();
      },
    );
  }
}
