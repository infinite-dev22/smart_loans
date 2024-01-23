import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_loans/config/responsive.dart';
import 'package:smart_loans/data_source/models/loan_model.dart';
import 'package:smart_loans/global_values.dart';
import 'package:smart_loans/init.dart';
import 'package:smart_loans/pages/interest_methods/bloc/interest_method_bloc.dart';
import 'package:smart_loans/pages/interest_periods/bloc/interest_period_bloc.dart';
import 'package:smart_loans/pages/loan_duration/bloc/loan_duration_bloc.dart';
import 'package:smart_loans/pages/loans/bloc/details/loan_details_bloc.dart';
import 'package:smart_loans/pages/loans/bloc/forms/interests/interest_form_bloc.dart';
import 'package:smart_loans/pages/loans/bloc/loan_bloc.dart';
import 'package:smart_loans/pages/repayment_cycle/bloc/repayment_cycle_bloc.dart';
import 'package:smart_loans/theme/light.dart';
import 'package:smart_loans/widgets/dialog_title_wdiget.dart';

class InterestForm extends StatelessWidget {
  final BuildContext? parentContext;

  const InterestForm({
    super.key,
    required this.loanModel,
    this.parentContext,
  });

  final LoanModel loanModel;

  @override
  Widget build(BuildContext context) {
    return BlocListener<InterestFormBloc, InterestFormState>(
      listener: (context, state) {
        if (state.status == InterestFormStatus.success) {
          if (parentContext != null) {
            BlocProvider.of<LoanDetailBloc>(parentContext!)
                .add(GetLoanDetail(loanModel.id!));
          }
          Navigator.of(context).pop();
        }
      },
      child: BlocBuilder<LoanBloc, LoanState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: SizedBox(
              width: (Responsive.isDesktop(context)) ? 25.w : 40.w,
              child: LayoutBuilder(builder: (context, constraints) {
                return Column(
                  children: [
                    const DialogTitleWidget(text: 'Edit Interest'),
                    Padding(
                      padding: EdgeInsets.all(padding),
                      child: Column(
                        children: [
                          BlocBuilder<InterestMethodBloc, InterestMethodState>(
                            builder: (context, state) {
                              if (state.status ==
                                  InterestMethodStatus.initial) {
                                context
                                    .read<InterestMethodBloc>()
                                    .add(GetInterestMethods());
                                return Container(
                                  height: 55,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                    border: Border.all(
                                        width: 1, color: LightAppColor.darker),
                                  ),
                                  child: const CupertinoActivityIndicator(),
                                );
                              }
                              if (state.status ==
                                  InterestMethodStatus.success) {
                                return SizedBox(
                                  height: 50,
                                  child: DropdownButtonFormField2(
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(8.0),
                                          ),
                                        ),
                                        label: Text("Interest Method")),
                                    items: context
                                        .read<InterestMethodBloc>()
                                        .state
                                        .interestMethods
                                        ?.map((clientType) => DropdownMenuItem(
                                              value: clientType.id,
                                              child: Text(clientType.name),
                                            ))
                                        .toList(),
                                    onChanged: (value) {
                                      interest.interestMethod = value;
                                    },
                                  ),
                                );
                              }
                              if (state.status == InterestMethodStatus.error) {
                                return Container(
                                  height: 55,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                    border: Border.all(
                                        width: 1, color: LightAppColor.darker),
                                  ),
                                  child: const Center(
                                    child: Icon(Icons.error_outline_rounded),
                                  ),
                                );
                              }
                              return Container(
                                height: 55,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  border: Border.all(
                                      width: 1, color: LightAppColor.darker),
                                ),
                                child: const CupertinoActivityIndicator(),
                              );
                            },
                          ),
                          SizedBox(height: 1.5.h),
                          BlocBuilder<InterestPeriodBloc, InterestPeriodState>(
                            builder: (context, state) {
                              if (state.status ==
                                  InterestPeriodStatus.initial) {
                                context
                                    .read<InterestPeriodBloc>()
                                    .add(GetInterestPeriods());
                                return Container(
                                  height: 55,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                    border: Border.all(
                                        width: 1, color: LightAppColor.darker),
                                  ),
                                  child: const CupertinoActivityIndicator(),
                                );
                              }
                              if (state.status ==
                                  InterestPeriodStatus.success) {
                                return SizedBox(
                                  height: 50,
                                  child: DropdownButtonFormField2(
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(8.0),
                                          ),
                                        ),
                                        label: Text("Interest Period")),
                                    items: context
                                        .read<InterestPeriodBloc>()
                                        .state
                                        .interestPeriods
                                        ?.map((clientType) => DropdownMenuItem(
                                              value: clientType.id,
                                              child: Text(clientType.name),
                                            ))
                                        .toList(),
                                    onChanged: (value) {
                                      interest.interestPeriod = value;
                                    },
                                  ),
                                );
                              }
                              if (state.status == InterestPeriodStatus.error) {
                                return Container(
                                  height: 55,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                    border: Border.all(
                                        width: 1, color: LightAppColor.darker),
                                  ),
                                  child: const Center(
                                    child: Icon(Icons.error_outline_rounded),
                                  ),
                                );
                              }
                              return Container(
                                height: 55,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  border: Border.all(
                                      width: 1, color: LightAppColor.darker),
                                ),
                                child: const CupertinoActivityIndicator(),
                              );
                            },
                          ),
                          SizedBox(height: 1.5.h),
                          BlocBuilder<RepaymentCycleBloc, RepaymentCycleState>(
                            builder: (context, state) {
                              if (state.status ==
                                  RepaymentCycleStatus.initial) {
                                context
                                    .read<RepaymentCycleBloc>()
                                    .add(GetRepaymentCycles());
                                return Container(
                                  height: 55,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                    border: Border.all(
                                        width: 1, color: LightAppColor.darker),
                                  ),
                                  child: const CupertinoActivityIndicator(),
                                );
                              }
                              if (state.status ==
                                  RepaymentCycleStatus.success) {
                                return SizedBox(
                                  height: 50,
                                  child: DropdownButtonFormField2(
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(8.0),
                                          ),
                                        ),
                                        label: Text("Repayment Cycle")),
                                    items: context
                                        .read<RepaymentCycleBloc>()
                                        .state
                                        .repaymentCycles
                                        ?.map((clientType) => DropdownMenuItem(
                                              value: clientType.id,
                                              child: Text(clientType.name),
                                            ))
                                        .toList(),
                                    onChanged: (value) {
                                      interest.repaymentCycleId = value;
                                    },
                                  ),
                                );
                              }
                              if (state.status == RepaymentCycleStatus.error) {
                                return Container(
                                  height: 55,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                    border: Border.all(
                                        width: 1, color: LightAppColor.darker),
                                  ),
                                  child: const Center(
                                    child: Icon(Icons.error_outline_rounded),
                                  ),
                                );
                              }
                              return Container(
                                height: 55,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  border: Border.all(
                                      width: 1, color: LightAppColor.darker),
                                ),
                                child: const CupertinoActivityIndicator(),
                              );
                            },
                          ),
                          SizedBox(height: 1.5.h),
                          BlocBuilder<LoanDurationBloc, LoanDurationState>(
                            builder: (context, state) {
                              if (state.status == LoanDurationStatus.initial) {
                                context
                                    .read<LoanDurationBloc>()
                                    .add(GetLoanDurations());
                                return Container(
                                  height: 55,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                    border: Border.all(
                                        width: 1, color: LightAppColor.darker),
                                  ),
                                  child: const CupertinoActivityIndicator(),
                                );
                              }
                              if (state.status == LoanDurationStatus.success) {
                                return SizedBox(
                                  height: 50,
                                  child: DropdownButtonFormField2(
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(8.0),
                                          ),
                                        ),
                                        label: Text("Loan Duration Type")),
                                    items: context
                                        .read<LoanDurationBloc>()
                                        .state
                                        .loanDurations
                                        ?.map((clientType) => DropdownMenuItem(
                                              value: clientType.id,
                                              child:
                                                  Text(clientType.name ?? ""),
                                            ))
                                        .toList(),
                                    onChanged: (value) {
                                      interest.loanDurationId = value;
                                    },
                                  ),
                                );
                              }
                              if (state.status == LoanDurationStatus.error) {
                                return Container(
                                  height: 55,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                    border: Border.all(
                                        width: 1, color: LightAppColor.darker),
                                  ),
                                  child: const Center(
                                    child: Icon(Icons.error_outline_rounded),
                                  ),
                                );
                              }
                              return Container(
                                height: 55,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  border: Border.all(
                                      width: 1, color: LightAppColor.darker),
                                ),
                                child: const CupertinoActivityIndicator(),
                              );
                            },
                          ),
                          SizedBox(height: 1.5.h),
                          SizedBox(
                            width: double.infinity,
                            height: 5.h,
                            child: TextFormField(
                              decoration: InputDecoration(
                                label: const Text("Loan Duration"),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              onChanged: (value) {
                                interest.loanDurationPeriod = value;
                              },
                            ),
                          ),
                          SizedBox(height: 1.5.h),
                          BlocListener<InterestFormBloc, InterestFormState>(
                            listener: (context, state) {
                              if (interest.interestType == 1) {
                                context
                                    .read<InterestFormBloc>()
                                    .add(ShowPercentage());
                              }
                              if (interest.interestType == 2) {
                                context
                                    .read<InterestFormBloc>()
                                    .add(ShowFixedRate());
                              }
                            },
                            child: SizedBox(
                              height: 50,
                              child: DropdownButtonFormField2(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(circularRadius),
                                      ),
                                    ),
                                    label: const Text("Interest Type")),
                                items: const [
                                  DropdownMenuItem(
                                    value: 1,
                                    child: Text("Percentage"),
                                  ),
                                  DropdownMenuItem(
                                    value: 2,
                                    child: Text("Fixed Rate"),
                                  ),
                                ],
                                onChanged: (value) {
                                  interest.interestType = value;
                                  if (value == 1) {
                                    context
                                        .read<InterestFormBloc>()
                                        .add(ShowPercentage());
                                  }
                                  if (value == 2) {
                                    context
                                        .read<InterestFormBloc>()
                                        .add(ShowFixedRate());
                                  }
                                },
                              ),
                            ),
                          ),
                          BlocBuilder<InterestFormBloc, InterestFormState>(
                            builder: (context, state) {
                              if (state.status ==
                                  InterestFormStatus.fixedRate) {
                                return _buildFixedRateBody(
                                    context, constraints);
                              } else if (state.status ==
                                  InterestFormStatus.percentage) {
                                return _buildPercentageBody(
                                    context, constraints);
                              } else {
                                return Container();
                              }
                            },
                          ),
                          SizedBox(height: 3.h),
                          FilledButton(
                            style: const ButtonStyle(
                              minimumSize: MaterialStatePropertyAll(
                                Size(double.infinity, 50),
                              ),
                            ),
                            child: const Text('Submit'),
                            onPressed: () {
                              interest.loanId = loanModel.id;
                              if (interest.percentage != null) {
                                interest.interestAmount =
                                    interestController.text;
                              }
                              context
                                  .read<InterestFormBloc>()
                                  .add(PostInterest(loanModel.id!, interest));
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPercentageBody(
      BuildContext context, BoxConstraints constraints) {
    return Column(
      children: [
        SizedBox(height: 1.5.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 50,
              width: 18.h,
              child: TextFormField(
                decoration: InputDecoration(
                  label: const Text("Percentage(%)"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(circularRadius),
                  ),
                ),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(3),
                ],
                onChanged: (value) {
                  interest.percentage = value;
                  var percentage = int.parse(value) * .01;
                  var interest2 = loanModel.principalAmount! * percentage;
                  interestController.text = interest2.toString();
                },
              ),
            ),
            SizedBox(
              height: 50,
              width: 25.h,
              child: TextFormField(
                readOnly: true,
                controller: interestController,
                decoration: InputDecoration(
                  label: Text(
                      "Interest${loan.currency != null ? '(${loan.currency!.code})' : ''}"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(circularRadius),
                      borderSide:
                          const BorderSide(color: LightAppColor.darker)),
                ),
                onChanged: (value) {},
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFixedRateBody(BuildContext context, BoxConstraints constraints) {
    return Column(
      children: [
        SizedBox(height: 1.5.h),
        SizedBox(
          height: 50,
          child: TextFormField(
            decoration: InputDecoration(
              label: Text(
                  "Interest${loan.currency != null ? '(${loan.currency!.code})' : ''}"),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(circularRadius),
              ),
            ),
            onChanged: (value) {
              interest.interestAmount = value;
            },
          ),
        ),
      ],
    );
  }
}
