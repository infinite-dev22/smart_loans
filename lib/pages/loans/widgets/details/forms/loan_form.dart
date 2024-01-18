import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_loans/config/responsive.dart';
import 'package:smart_loans/global_values.dart';
import 'package:smart_loans/init.dart';
import 'package:smart_loans/pages/branches/bloc/branch_bloc.dart';
import 'package:smart_loans/pages/clients/bloc/clients_bloc/clients_bloc.dart';
import 'package:smart_loans/pages/currencies/bloc/currency_bloc.dart';
import 'package:smart_loans/pages/loan_category/bloc/loan_category_bloc.dart';
import 'package:smart_loans/pages/loan_type/bloc/loan_type_bloc.dart';
import 'package:smart_loans/pages/loans/bloc/forms/loans/loan_form_bloc.dart';
import 'package:smart_loans/pages/loans/bloc/loan_bloc.dart';
import 'package:smart_loans/theme/light.dart';
import 'package:smart_loans/widgets/custom_form_inputs/custom_currency_text_field.dart';
import 'package:smart_loans/widgets/dialog_title_wdiget.dart';

class LoanForm extends StatefulWidget {
  const LoanForm({super.key});

  @override
  State<LoanForm> createState() => _LoanFormState();
}

class _LoanFormState extends State<LoanForm> {
  var interestController = TextEditingController();
  var principalAmountController = TextEditingController();
  final FilteringTextInputFormatter _formatNumerals =
      FilteringTextInputFormatter(RegExp(r'[^0-9.]'), allow: false);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoanBloc, LoanState>(
      listener: (context, state) {
        if (state.status == LoanStatus.success) {
          BlocProvider.of<LoanBloc>(context).add(GetLoans());
          Navigator.of(context).pop();
        }
      },
      child: SingleChildScrollView(
        child: SizedBox(
          width: (Responsive.isDesktop(context)) ? 25.w : 40.w,
          child: Column(
            children: [
              const DialogTitleWidget(text: 'Loan Form'),
              _buildAddForm(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAddForm(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: SizedBox(
        width: (Responsive.isDesktop(context)) ? 30.w : 40.w,
        child: LayoutBuilder(builder: (context, constraints) {
          return Column(
            children: [
              BlocBuilder<ClientsBloc, ClientsState>(
                builder: (context, state) {
                  if (state.status == ClientsStatus.initial) {
                    context.read<ClientsBloc>().add(GetClients());
                    return Container(
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        border:
                            Border.all(width: 1, color: LightAppColor.darker),
                      ),
                      child: const CupertinoActivityIndicator(),
                    );
                  }
                  if (state.status == ClientsStatus.success) {
                    return SizedBox(
                      height: 50,
                      child: DropdownButtonFormField2(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                            label: Text("Clients")),
                        items: context
                            .read<ClientsBloc>()
                            .state
                            .clients
                            ?.map((clients) => DropdownMenuItem(
                                  value: clients.id,
                                  child: Text(clients.name!),
                                ))
                            .toList(),
                        onChanged: (value) => loan.clientId = value,
                      ),
                    );
                  }
                  if (state.status == ClientsStatus.error) {
                    return Container(
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        border:
                            Border.all(width: 1, color: LightAppColor.darker),
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
                      border: Border.all(width: 1, color: LightAppColor.darker),
                    ),
                    child: const CupertinoActivityIndicator(),
                  );
                },
              ),
              SizedBox(height: 2.h),
              BlocBuilder<LoanTypeBloc, LoanTypeState>(
                builder: (context, state) {
                  if (state.status == LoanTypeStatus.initial) {
                    context.read<LoanTypeBloc>().add(GetLoanTypes());
                    return Container(
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        border:
                            Border.all(width: 1, color: LightAppColor.darker),
                      ),
                      child: const CupertinoActivityIndicator(),
                    );
                  }
                  if (state.status == LoanTypeStatus.success) {
                    return SizedBox(
                      height: 50,
                      child: DropdownButtonFormField2(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                            label: Text("Loan Type")),
                        items: context
                            .read<LoanTypeBloc>()
                            .state
                            .loanTypes
                            ?.map((clients) => DropdownMenuItem(
                                  value: clients.id,
                                  child: Text(clients.name!),
                                ))
                            .toList(),
                        onChanged: (value) => loan.loanTypeId = value,
                      ),
                    );
                  }
                  if (state.status == LoanTypeStatus.error) {
                    return Container(
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        border:
                            Border.all(width: 1, color: LightAppColor.darker),
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
                      border: Border.all(width: 1, color: LightAppColor.darker),
                    ),
                    child: const CupertinoActivityIndicator(),
                  );
                },
              ),
              SizedBox(height: 2.h),
              BlocBuilder<LoanCategoryBloc, LoanCategoryState>(
                builder: (context, state) {
                  if (state.status == LoanCategoryStatus.initial) {
                    context.read<LoanCategoryBloc>().add(GetLoanCategories());
                    return Container(
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        border:
                            Border.all(width: 1, color: LightAppColor.darker),
                      ),
                      child: const CupertinoActivityIndicator(),
                    );
                  }
                  if (state.status == LoanCategoryStatus.success) {
                    return SizedBox(
                      height: 50,
                      child: DropdownButtonFormField2(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                            label: Text("Loan Category")),
                        items: context
                            .read<LoanCategoryBloc>()
                            .state
                            .loanCategories
                            ?.map((clients) => DropdownMenuItem(
                                  value: clients.id,
                                  child: Text(clients.name!),
                                ))
                            .toList(),
                        onChanged: (value) => loan.loanCategoryId = value,
                      ),
                    );
                  }
                  if (state.status == LoanCategoryStatus.error) {
                    return Container(
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        border:
                            Border.all(width: 1, color: LightAppColor.darker),
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
                      border: Border.all(width: 1, color: LightAppColor.darker),
                    ),
                    child: const CupertinoActivityIndicator(),
                  );
                },
              ),
              SizedBox(height: 2.h),
              BlocBuilder<BranchBloc, BranchState>(
                builder: (context, state) {
                  if (state.status == BranchStatus.initial) {
                    context.read<BranchBloc>().add(GetBranches());
                    return Container(
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        border:
                            Border.all(width: 1, color: LightAppColor.darker),
                      ),
                      child: const CupertinoActivityIndicator(),
                    );
                  }
                  if (state.status == BranchStatus.success) {
                    return SizedBox(
                      height: 50,
                      child: DropdownButtonFormField2(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                            label: Text("Branch")),
                        items: context
                            .read<BranchBloc>()
                            .state
                            .branches
                            ?.map((clients) => DropdownMenuItem(
                                  value: clients.id,
                                  child: Text(clients.name!),
                                ))
                            .toList(),
                        onChanged: (value) => loan.branchId = value,
                      ),
                    );
                  }
                  if (state.status == BranchStatus.error) {
                    return Container(
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        border:
                            Border.all(width: 1, color: LightAppColor.darker),
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
                      border: Border.all(width: 1, color: LightAppColor.darker),
                    ),
                    child: const CupertinoActivityIndicator(),
                  );
                },
              ),
              SizedBox(height: 2.h),
              SizedBox(
                height: 55,
                child: TextFormField(
                  decoration: InputDecoration(
                    label: const Text("Description"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(circularRadius),
                    ),
                  ),
                  onChanged: (value) => loan.description = value,
                ),
              ),
              SizedBox(height: 2.h),
              Wrap(
                children: [
                  BlocBuilder<CurrencyBloc, CurrencyState>(
                    builder: (context, state) {
                      if (state.status == CurrencyStatus.initial) {
                        context.read<CurrencyBloc>().add(GetCurrencies());
                        return Container(
                          height: 55,
                          width: constraints.maxWidth * .5,
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
                      if (state.status == CurrencyStatus.success) {
                        return SizedBox(
                          height: 55,
                          width: constraints.maxWidth * .5,
                          child: DropdownButtonFormField2(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                ),
                                label: Text("Currency")),
                            items: context
                                .read<CurrencyBloc>()
                                .state
                                .currencies
                                ?.map((clients) => DropdownMenuItem(
                                      value: clients.id,
                                      child: Text(clients.name!),
                                    ))
                                .toList(),
                            onChanged: (value) => loan.currencyId = value,
                          ),
                        );
                      }
                      if (state.status == CurrencyStatus.error) {
                        return Container(
                          height: 55,
                          width: constraints.maxWidth * .5,
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
                        width: constraints.maxWidth * .5,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                          border:
                              Border.all(width: 1, color: LightAppColor.darker),
                        ),
                        child: const CupertinoActivityIndicator(),
                      );
                    },
                  ),
                  SizedBox(width: 2.h),
                  SizedBox(
                    height: 55,
                    width: constraints.maxWidth * .45,
                    child: CustomCurrencyTextField(
                      decoration: InputDecoration(
                        label: const Text("Amount"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(circularRadius),
                        ),
                      ),
                      controller: principalAmountController,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              BlocListener<LoanFormBloc, LoanFormState>(
                listener: (context, state) {
                  if (loan.loanTypeId == 1) {
                    context.read<LoanFormBloc>().add(SetPercentage());
                  }
                  if (loan.loanTypeId == 2) {
                    context.read<LoanFormBloc>().add(SetFixedRate());
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
                        label: const Text("Loan Fees")),
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
                      loan.loanTypeId = value;
                      if (value == 1) {
                        context.read<LoanFormBloc>().add(SetPercentage());
                      }
                      if (value == 2) {
                        context.read<LoanFormBloc>().add(SetFixedRate());
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: 2.h),
              BlocBuilder<LoanFormBloc, LoanFormState>(
                builder: (context, state) {
                  if (state.status == LoanFormStatus.fixedRate) {
                    return _buildFixedRateBody(context, constraints);
                  } else if (state.status == LoanFormStatus.percentage) {
                    return _buildPercentageBody(context, constraints);
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
                  interest.interestAmount = interestController.text;
                  loan.principalAmount = double.parse(
                      principalAmountController.text.replaceAll(",", ""));
                  context.read<LoanBloc>().add(CreateLoan(loan));
                },
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildPercentageBody(
      BuildContext context, BoxConstraints constraints) {
    return Row(
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
              // _formatNumerals,
              LengthLimitingTextInputFormatter(4),
            ],
            onChanged: (value) {
              var percentage = value.isNotEmpty ? double.parse(value) * .01 : 0;
              var interest = double.parse(
                      principalAmountController.text.replaceAll(",", "")) *
                  percentage;
              interestController.text = interest.toString();
            },
          ),
        ),
        SizedBox(
          height: 50,
          width: 25.h,
          child: CustomCurrencyTextField(
            readOnly: true,
            controller: interestController,
            decoration: InputDecoration(
              label: Text(
                  "Interest${loan.currency != null ? '(${loan.currency!.code})' : ''}"),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(circularRadius),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFixedRateBody(BuildContext context, BoxConstraints constraints) {
    return SizedBox(
      height: 50,
      child: CustomCurrencyTextField(
        decoration: InputDecoration(
          label: Text(
              "Interest${loan.currency != null ? '(${loan.currency!.code})' : ''}"),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(circularRadius),
          ),
        ),
        controller: interestController,
      ),
    );
  }
}
