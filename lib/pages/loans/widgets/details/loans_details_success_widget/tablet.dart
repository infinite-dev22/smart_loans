import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile_photo/profile_photo.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
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

class LoanDetailSuccessTablet extends StatelessWidget {
  const LoanDetailSuccessTablet({super.key});

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
                              SizedBox(
                                width: 1.w,
                              ),
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
                              SizedBox(
                                width: 1.w,
                              ),
                              Column(
                                children: [
                                  FilledButton(
                                    onPressed: () =>
                                        _buildProcessDialog(context, loan),
                                    child: const Text("Process"),
                                  ),
                                  SizedBox(width: 2.h),
                                  FilledButton(
                                    onPressed: () =>
                                        _buildInterestForm(context, loan),
                                    child: const Text("Edit Interest"),
                                  ),
                                ],
                              ),
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

  _buildProcessDialog(BuildContext context, LoanModel? loan) async {
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
            child: LoanProcessForm(loanId: loan!.id!),
          ),
        );
      },
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
          ], child: const LoanForm()),
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
        const LoanOfficerWidget(),
        SizedBox(height: 2.h),
        const LoanSummaryWidget(),
      ],
    );
  }
}
