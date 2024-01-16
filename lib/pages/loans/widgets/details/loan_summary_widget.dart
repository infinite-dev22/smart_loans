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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Loan No.: "),
                      if (loanDetail.createdAt != null) const Text("Created: "),
                      if (loanDetail.releasedAt != null)
                        const Text("Released: "),
                      if (loanDetail.maturity != null) const Text("Maturity: "),
                      if (loanDetail.principalAmount != null)
                        const Text("Principal: "),
                      if (loanDetail.loanInterest != null)
                        const Text("Loan Rate: "),
                      if (loanDetail.loanFees != null)
                        const Text("Loan Fees: "),
                      if (loanDetail.paidAmount != null) const Text("Paid: "),
                      if (loanDetail.balanceAmount != null)
                        const Text("Balance: "),
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
                      if (loanDetail.createdAt != null)
                        Text(
                          DateFormat('dd.MM.yyyy').format(loanDetail.createdAt),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      if (loanDetail.releasedAt != null)
                        Text(
                          DateFormat('dd.MM.yyyy')
                              .format(loanDetail.releasedAt),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      if (loanDetail.maturity != null)
                        Text(
                          "${loanDetail.currency} ${loanDetail.maturity}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      if (loanDetail.principalAmount != null)
                        Text(
                          "${loanDetail.currency} ${loanDetail.principalAmount}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      if (loanDetail.loanInterest != null)
                        Text(
                          "${loanDetail.currency} ${loanDetail.loanInterest}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      if (loanDetail.loanFees != null)
                        Text(
                          "${loanDetail.currency} ${loanDetail.loanFees}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      if (loanDetail.paidAmount != null)
                        Text(
                          "${loanDetail.currency} ${loanDetail.paidAmount}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      if (loanDetail.balanceAmount != null)
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
