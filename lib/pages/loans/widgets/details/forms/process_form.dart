import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_loans/config/responsive.dart';
import 'package:smart_loans/data_source/models/loan_detail_model.dart';
import 'package:smart_loans/global_values.dart';
import 'package:smart_loans/init.dart';
import 'package:smart_loans/pages/loans/bloc/loan_bloc.dart';
import 'package:smart_loans/theme/colors.dart';
import 'package:smart_loans/widgets/dialog_title_wdiget.dart';

class LoanProcessForm extends StatelessWidget {
  final LoanDetailModel loanDetail;

  const LoanProcessForm({super.key, required this.loanDetail});

  @override
  Widget build(BuildContext context) {
    print(loanDetail.loanStatus.toUpperCase());
    return SingleChildScrollView(
      child: SizedBox(
        width: (Responsive.isDesktop(context)) ? 25.w : 40.w,
        child: Column(
          children: [
            const DialogTitleWidget(text: 'Process Loan'),
            Padding(
              padding: EdgeInsets.all(padding),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 5.h,
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: const Text("Comment"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onChanged: (value) {
                        loanProcess.comment = value;
                      },
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    mainAxisAlignment: (Responsive.isDesktop(context))
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.spaceBetween,
                    children: [
                      if (loanDetail.loanStatus.toUpperCase() == "OPENED")
                        OutlinedButton(
                          style: const ButtonStyle(
                            foregroundColor:
                                MaterialStatePropertyAll(AppColor.red),
                            side: MaterialStatePropertyAll(
                                BorderSide(color: AppColor.red)),
                          ),
                          child: const Text('Reject',
                              style: TextStyle(fontWeight: FontWeight.w600)),
                          onPressed: () {
                            loanProcess.submit = "REJECTED";
                            context
                                .read<LoanBloc>()
                                .add(ProcessLoan(loanDetail.id, loanProcess));
                            Navigator.of(context).pop();
                          },
                        ),
                      SizedBox(width: 1.w),
                      if (loanDetail.flowType.toUpperCase() == "LV1")
                        if (loanDetail.loanStatus.toUpperCase() == "OPENED")
                          FilledButton(
                            child: const Text('Approve'),
                            onPressed: () {
                              loanProcess.submit = "APPROVED";
                              context
                                  .read<LoanBloc>()
                                  .add(ProcessLoan(loanDetail.id, loanProcess));
                              Navigator.of(context).pop();
                            },
                          )
                        else
                          Container()
                      else if (loanDetail.flowType.toUpperCase() == "LV2")
                        if (loanDetail.loanStatus.toUpperCase() == "OPENED")
                          FilledButton(
                            child: const Text('Pre-Approve'),
                            onPressed: () {
                              loanProcess.submit = "PRIMARY_APPROVED";
                              context
                                  .read<LoanBloc>()
                                  .add(ProcessLoan(loanDetail.id, loanProcess));
                              Navigator.of(context).pop();
                            },
                          )
                        else if (loanDetail.loanStatus.toUpperCase() ==
                            "PRIMARILY APPROVED")
                          FilledButton(
                            child: const Text('Approve'),
                            onPressed: () {
                              loanProcess.submit = "SECONDARY_APPROVED";
                              context
                                  .read<LoanBloc>()
                                  .add(ProcessLoan(loanDetail.id, loanProcess));
                              Navigator.of(context).pop();
                            },
                          ),
                      SizedBox(width: 1.w),
                      if (loanDetail.loanStatus.toUpperCase() == "APPROVED" ||
                          loanDetail.loanStatus.toUpperCase() ==
                              "SECONDARILY_APPROVED")
                        FilledButton(
                          style: const ButtonStyle(
                            foregroundColor:
                                MaterialStatePropertyAll(Colors.orangeAccent),
                            side: MaterialStatePropertyAll(
                                BorderSide(color: Colors.orangeAccent)),
                          ),
                          child: const Text('Disburse'),
                          onPressed: () {
                            loanProcess.submit = "DISBURSED";
                            context
                                .read<LoanBloc>()
                                .add(ProcessLoan(loanDetail.id, loanProcess));
                            Navigator.of(context).pop();
                          },
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
