import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile_photo/profile_photo.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_loans/config/responsive.dart';
import 'package:smart_loans/data_source/models/loan_model.dart';
import 'package:smart_loans/global_values.dart';
import 'package:smart_loans/pages/interest_methods/bloc/interest_method_bloc.dart';
import 'package:smart_loans/pages/interest_periods/bloc/interest_period_bloc.dart';
import 'package:smart_loans/pages/loan_duration/bloc/loan_duration_bloc.dart';
import 'package:smart_loans/pages/loan_schedules/bloc/loan_schedule_bloc.dart';
import 'package:smart_loans/pages/loans/bloc/details/loan_details_bloc.dart';
import 'package:smart_loans/pages/loans/bloc/forms/interests/interest_form_bloc.dart';
import 'package:smart_loans/pages/loans/bloc/loan_bloc.dart';
import 'package:smart_loans/pages/loans/widgets/details/forms/interest_form.dart';
import 'package:smart_loans/pages/loans/widgets/details/forms/loan_form.dart';
import 'package:smart_loans/pages/loans/widgets/details/forms/process_form.dart';
import 'package:smart_loans/pages/repayment_cycle/bloc/repayment_cycle_bloc.dart';
import 'package:smart_loans/theme/colors.dart';

import 'loan_details_tabbed_display.dart';
import 'loan_officer_widget.dart';
import 'loan_summary_widget.dart';

class LoanDetailSuccessWidget extends StatelessWidget {
  const LoanDetailSuccessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoanDetailBloc, LoanDetailState>(
      builder: (context, state) {
        return _buildBody(context);
      },
    );
  }

  Widget _buildBody(BuildContext context) {
    var loan = context.read<LoanDetailBloc>().state.loan;
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: SizedBox(
                width: (Responsive.isDesktop(context))
                    ? 67.w
                    : (Responsive.isTablet(context))
                        ? 75.w
                        : (Responsive.isMobile(context))
                            ? 95.w
                            : 100.w,
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
                                    name: context
                                        .read<LoanDetailBloc>()
                                        .state
                                        .loan!
                                        .clientName
                                        .toString(),
                                    outlineColor:
                                        colors[Random().nextInt(colors.length)],
                                  ),
                                  SizedBox(width: 1.w),
                                  const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Loan No.: "),
                                      Text("Client Name: "),
                                      Text("Client No.: "),
                                      Text("Address: "),
                                      Text("Loan Status: "),
                                      Text("Flow Type: "),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        context
                                            .read<LoanDetailBloc>()
                                            .state
                                            .loan!
                                            .id
                                            .toString(),
                                        style: const TextStyle(
                                          color: AppColor.red,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        context
                                            .read<LoanDetailBloc>()
                                            .state
                                            .loan!
                                            .client!
                                            .name
                                            .toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        context
                                            .read<LoanDetailBloc>()
                                            .state
                                            .loan!
                                            .client!
                                            .telephone
                                            .toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        context
                                            .read<LoanDetailBloc>()
                                            .state
                                            .loan!
                                            .client!
                                            .address
                                            .toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        // "APPROVED (4.12.2023)",
                                        context
                                            .read<LoanDetailBloc>()
                                            .state
                                            .loan!
                                            .loanStatus!
                                            .name
                                            .toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Text(
                                        "LV2(To Be Added)",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              if (Responsive.isDesktop(context) ||
                                  Responsive.isTablet(context))
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          context
                                              .read<LoanDetailBloc>()
                                              .state
                                              .loan!
                                              .loanType!
                                              .name
                                              .toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          context
                                              .read<LoanDetailBloc>()
                                              .state
                                              .loan!
                                              .principalAmount!
                                              .toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          context
                                                      .read<LoanDetailBloc>()
                                                      .state
                                                      .loan!
                                                      .loanFees !=
                                                  null
                                              ? context
                                                  .read<LoanDetailBloc>()
                                                  .state
                                                  .loan!
                                                  .loanFees!
                                                  .toString()
                                              : "N/A",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          context
                                                      .read<LoanDetailBloc>()
                                                      .state
                                                      .loan!
                                                      .loanFees !=
                                                  null
                                              ? "${context.read<LoanDetailBloc>().state.loan!.loanFees!} Showing Loan Fee"
                                              : "N/A",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const Text(
                                          "10 Months",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const Text(
                                          "Monthly",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              if (Responsive.isDesktop(context) ||
                                  Responsive.isTablet(context))
                                Row(
                                  children: [
                                    FilledButton(
                                      onPressed: () =>
                                          _buildInterestForm(context, loan),
                                      child: const Text("Edit Interest"),
                                    ),
                                    SizedBox(width: 1.w),
                                    FilledButton(
                                      onPressed: () =>
                                          _buildProcessDialog(context),
                                      child: const Text("Process Loan"),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                          if (Responsive.isMobile(context))
                            SizedBox(height: 1.h),
                          if (Responsive.isMobile(context))
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
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "UGX 2,000,000",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "UGX 200,000",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "UGX 100,000",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "10 Months",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Monthly",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          if (Responsive.isMobile(context))
                            Column(
                              children: [
                                SizedBox(height: 2.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    FilledButton(
                                      onPressed: () =>
                                          _buildInterestForm(context, loan),
                                      child: const Text("Edit Interest"),
                                    ),
                                    SizedBox(width: 1.w),
                                    FilledButton(
                                      onPressed: () =>
                                          _buildProcessDialog(context),
                                      child: const Text("Process Loan"),
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
            if (Responsive.isDesktop(context)) SizedBox(width: 1.w),
            if (Responsive.isDesktop(context)) const RightSideWidget(),
          ],
        ),
        if (Responsive.isTablet(context) || Responsive.isMobile(context))
          const RightSideWidget(),
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
            child: InterestForm(loanModel: loan!),
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
          child: const LoanProcessForm(),
        );
      },
    );
  }
}

class RightSideWidget extends StatelessWidget {
  const RightSideWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(padding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FilledButton(
                onPressed: () => _buildLoanAddDialog(context),
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
                onPressed: () => _buildLoanAddDialog(context),
                child: const Text("Add Loan"),
              ),
              SizedBox(width: 1.w),
            ],
          ),
        ),
        const LoanOfficerWidget(),
        SizedBox(height: 2.h),
        const LoanSummaryWidget(),
        if (!Responsive.isDesktop(context)) SizedBox(height: 30.h),
      ],
    );
  }

  _buildLoanAddDialog(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(circularRadius),
          ),
          child: const LoanForm(),
        );
      },
    );
  }
}
