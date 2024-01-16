import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_loans/data_source/models/loan_detail_model.dart';
import 'package:smart_loans/data_source/models/loan_model.dart';
import 'package:smart_loans/global_values.dart';
import 'package:smart_loans/theme/colors.dart';

class LoanSummaryWidget extends StatelessWidget {
  final double? width;
  final LoanModel loan;
  final LoanDetailModel loanDetail;

  const LoanSummaryWidget({
    super.key,
    this.width,
    required this.loan,
    required this.loanDetail,
  });

  @override
  Widget build(BuildContext context) {
    print(DateFormat("yyyy-MM-dd"));
    return Card(
      child: SizedBox(
        width: width,
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
                      "Loans Summary",
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Loan No.: "),
                      Text("Created: "),
                      Text("Released: "),
                      Text("Maturity: "),
                      Text("Principal: "),
                      Text("Loan Rate: "),
                      Text("Loan Fees: "),
                      Text("Paid: "),
                      Text("Balance: "),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        loan.loanNumber!,
                        style: const TextStyle(
                          color: AppColor.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        DateFormat('dd.MM.yyyy').format(loanDetail.createdAt),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        DateFormat('dd.MM.yyyy').format(loanDetail.releasedAt),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${loanDetail.currency} ${loanDetail.maturity}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${loanDetail.currency} ${loanDetail.principalAmount}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${loanDetail.currency} ${loanDetail.loanInterest}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${loanDetail.currency} ${loanDetail.loanFees}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${loanDetail.currency} ${loanDetail.paidAmount}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${loanDetail.currency} ${loanDetail.balanceAmount}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
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
