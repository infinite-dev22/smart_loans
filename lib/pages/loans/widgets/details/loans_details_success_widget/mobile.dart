import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile_photo/profile_photo.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_loans/data_source/models/loan_detail_model.dart';
import 'package:smart_loans/data_source/models/loan_model.dart';
import 'package:smart_loans/global_values.dart';
import 'package:smart_loans/pages/branches/bloc/branch_bloc.dart';
import 'package:smart_loans/pages/clients/bloc/clients_bloc/clients_bloc.dart';
import 'package:smart_loans/pages/currencies/bloc/currency_bloc.dart';
import 'package:smart_loans/pages/interest_methods/bloc/interest_method_bloc.dart';
import 'package:smart_loans/pages/interest_periods/bloc/interest_period_bloc.dart';
import 'package:smart_loans/pages/loan_category/bloc/loan_category_bloc.dart';
import 'package:smart_loans/pages/loan_duration/bloc/loan_duration_bloc.dart';
import 'package:smart_loans/pages/loan_schedules/bloc/loan_schedule_bloc.dart';
import 'package:smart_loans/pages/loan_type/bloc/loan_type_bloc.dart';
import 'package:smart_loans/pages/loans/bloc/details/loan_details_bloc.dart';
import 'package:smart_loans/pages/loans/bloc/forms/interests/interest_form_bloc.dart';
import 'package:smart_loans/pages/loans/bloc/forms/loans/loan_form_bloc.dart';
import 'package:smart_loans/pages/loans/bloc/loan_bloc.dart';
import 'package:smart_loans/pages/loans/widgets/details/forms/interest_form.dart';
import 'package:smart_loans/pages/loans/widgets/details/forms/loan_form.dart';
import 'package:smart_loans/pages/loans/widgets/details/forms/process_form.dart';
import 'package:smart_loans/pages/repayment_cycle/bloc/repayment_cycle_bloc.dart';
import 'package:smart_loans/theme/colors.dart';
import 'package:smart_loans/widgets/title_with_actions.dart';

import '../loan_details_tabbed_display.dart';
import '../loan_officer_widget.dart';
import '../loan_summary_widget.dart';

class LoanDetailSuccessMobile extends StatelessWidget {
  final LoanDetailModel loanDetail;
  final LoanModel loan;
  final BuildContext parentContext;

  const LoanDetailSuccessMobile({
    super.key,
    required this.loan,
    required this.loanDetail, required this.parentContext,
  });

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Card(
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
                      child: TitleBarWithActions(
                        title: "Loan",
                        actions: [
                          IconButton(
                              tooltip: "Edit loan",
                              onPressed: () => _buildLoanAddDialog(context),
                              icon: const Icon(
                                Icons.edit_rounded,
                                color: AppColor.white,
                              )),
                          IconButton(
                            tooltip: "Add loan",
                            onPressed: () => _buildLoanAddDialog(context),
                            icon: const Icon(
                              Icons.add,
                              color: AppColor.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(padding),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ProfilePhoto(
                                    totalWidth: 10.h,
                                    color: AppColor.white45,
                                    name: loan.clientName.toString(),
                                    outlineColor:
                                        colors[Random().nextInt(colors.length)],
                                  ),
                                  SizedBox(width: 1.w),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if (loan.loanNumber != null)
                                        const Text("Loan No.: "),
                                      if (loan.client!.name != null)
                                        const Text("Client Name: "),
                                      if (loan.client!.telephone != null)
                                        const Text("Client No.: "),
                                      if (loan.client!.address != null)
                                        const Text("Address: "),
                                      const Text("Loan Status: "),
                                      const Text("Flow Type: "),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if (loan.loanNumber != null)
                                        Text(
                                          loan.loanNumber.toString(),
                                          style: const TextStyle(
                                            color: AppColor.red,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      if (loan.client!.name != null)
                                        Text(
                                          loan.client!.name.toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      if (loan.client!.telephone != null)
                                        Text(
                                          loan.client!.telephone.toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      if (loan.client!.address != null)
                                        Text(
                                          loan.client!.address.toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      Text(
                                        // "APPROVED (4.12.2023)",
                                        loanDetail.loanStatusName.toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        loanDetail.flowType.toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 1.h),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Loan Type: "),
                                  const Text("Principal: "),
                                  if (loanDetail.loanFees != null)
                                    const Text("Loan Fee: "),
                                  if (loanDetail.loanInterest != null)
                                    const Text("Loan Interest: "),
                                  if (loanDetail.loanDuration != null)
                                    const Text("Loan Duration: "),
                                  if (loanDetail.repaymentCycle != null)
                                    const Text("Repayment Cycle: "),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    loanDetail.loanType.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    loanDetail.principalAmount.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  if (loanDetail.loanFees != null)
                                    Text(
                                      loanDetail.loanFees.toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  if (loanDetail.loanInterest != null)
                                    Text(
                                      loanDetail.loanInterest.toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  if (loanDetail.loanDuration != null)
                                    Text(
                                      "${loanDetail.loanDuration} ${loanDetail.repaymentCycle}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  if (loanDetail.repaymentCycle != null)
                                    Text(
                                      loanDetail.repaymentCycle.toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                ],
                              ),
                            ],
                          ),
                          if (loanDetail.loanStatusCode != null &&
                              loanDetail.loanStatusCode.toUpperCase() !=
                                  "DISBURSED")
                            Column(
                              children: [
                                SizedBox(height: 2.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    FilledButton(
                                      onPressed: () =>
                                          _buildInterestForm(context, loan),
                                      child: Text(
                                          '${(loanDetail.loanStatusCode.toUpperCase() == "OPENED") ? 'Add' : 'Edit'} Interest'),
                                    ),
                                    SizedBox(width: 1.w),
                                    FilledButton(
                                      onPressed: () =>
                                          _buildProcessDialog(context),
                                      child: const Text("Process"),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 2.h),
                              ],
                            ),
                        ],
                      ),
                    ),
                    MultiBlocProvider(
                      providers: [
                        BlocProvider<ClientsBloc>(
                          create: (_) => ClientsBloc(),
                        ),
                        BlocProvider<LoanBloc>(
                          create: (_) => LoanBloc(),
                        ),
                        BlocProvider<LoanDetailBloc>(
                          create: (_) => LoanDetailBloc(),
                        ),
                        BlocProvider<LoanScheduleBloc>(
                          create: (_) => LoanScheduleBloc(),
                        ),
                      ],
                      child: LoanDetailsTabbedDisplay(
                          loanId:
                              context.read<LoanDetailBloc>().state.loan!.id!),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        if (kDebugMode)
        RightSideWidget(
          loanDetail: loanDetail,
          loan: loan,
        ),
      ],
    );
  }

  _buildInterestForm(BuildContext context, LoanModel? loan) async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(circularRadius),
          ),
          child: MultiBlocProvider(
            providers: [
              BlocProvider<InterestMethodBloc>(
                create: (_) => InterestMethodBloc(),
              ),
              BlocProvider<InterestPeriodBloc>(
                create: (_) => InterestPeriodBloc(),
              ),
              BlocProvider<RepaymentCycleBloc>(
                create: (_) => RepaymentCycleBloc(),
              ),
              BlocProvider<LoanDurationBloc>(
                create: (_) => LoanDurationBloc(),
              ),
              BlocProvider<LoanBloc>(
                create: (_) => LoanBloc(),
              ),
              BlocProvider<InterestFormBloc>(
                create: (_) => InterestFormBloc(),
              ),
            ],
            child: InterestForm(
              loanModel: loan!,
              parentContext: parentContext,
            ),
          ),
        );
      },
    );
  }

  _buildProcessDialog(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(circularRadius),
          ),
          child: BlocProvider(
            create: (context) => LoanBloc(),
            child: LoanProcessForm(loanDetail: loanDetail),
          ),
        );
      },
    );
  }

  _buildLoanAddDialog(BuildContext parentContext) async {
    return showDialog(
      context: parentContext,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(circularRadius),
          ),
          child: MultiBlocProvider(providers: [
            BlocProvider<LoanBloc>(
              create: (_) => LoanBloc(),
            ),
            BlocProvider<LoanFormBloc>(
              create: (_) => LoanFormBloc(),
            ),
            BlocProvider<ClientsBloc>(
              create: (_) => ClientsBloc(),
            ),
            BlocProvider<LoanTypeBloc>(
              create: (_) => LoanTypeBloc(),
            ),
            BlocProvider<LoanCategoryBloc>(
              create: (_) => LoanCategoryBloc(),
            ),
            BlocProvider<BranchBloc>(
              create: (_) => BranchBloc(),
            ),
            BlocProvider<CurrencyBloc>(
              create: (_) => CurrencyBloc(),
            ),
          ], child: LoanForm(parentContext: parentContext)),
        );
      },
    );
  }
}

class RightSideWidget extends StatelessWidget {
  final LoanDetailModel loanDetail;
  final LoanModel loan;

  const RightSideWidget({
    super.key,
    required this.loan,
    required this.loanDetail,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: padding),
      child: Column(
        children: [
          const LoanOfficerWidget(),
          SizedBox(height: 2.h),
          LoanSummaryWidget(
            loan: loan,
            loanDetail: loanDetail,
          ),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }
}
