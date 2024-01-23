import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_loans/config/responsive.dart';
import 'package:smart_loans/pages/loans/bloc/details/loan_details_bloc.dart';
import 'package:smart_loans/pages/loans/widgets/details/loans_details_success_widget/desktop.dart';
import 'package:smart_loans/pages/loans/widgets/details/loans_details_success_widget/mobile.dart';
import 'package:smart_loans/pages/loans/widgets/details/loans_details_success_widget/tablet.dart';
import 'package:smart_loans/pages/loans/widgets/error/loan_details_error_widget.dart';
import 'package:smart_loans/pages/loans/widgets/initial/loan_details_initial_widget.dart';
import 'package:smart_loans/pages/loans/widgets/loading/loan_details_loading_widget.dart';

class LoanDetailsPageLayout extends StatelessWidget {
  final int loanId;

  const LoanDetailsPageLayout({
    super.key,
    required this.loanId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoanDetailBloc, LoanDetailState>(
      builder: (childContext, state) {
        if (state.status == LoanDetailStatus.initial) {
          childContext.read<LoanDetailBloc>().add(GetLoanDetail(loanId));
        } else if (state.status == LoanDetailStatus.success) {
          var loan = childContext.read<LoanDetailBloc>().state.loan;
          var loanDetail = childContext.read<LoanDetailBloc>().state.loanDetail;
          return SingleChildScrollView(
            child: Responsive(
              mobile: LoanDetailSuccessMobile(
                loan: loan!,
                loanDetail: loanDetail!,
                parentContext: context,
              ),
              tablet: LoanDetailSuccessTablet(
                loan: loan,
                loanDetail: loanDetail,
                parentContext: context,
              ),
              desktop: LoanDetailSuccessDesktop(
                loan: loan,
                loanDetail: loanDetail,
                parentContext: context,
              ),
            ),
          );
        } else if (state.status == LoanDetailStatus.loading) {
          return const LoanDetailsLoadingWidget();
        } else if (state.status == LoanDetailStatus.error) {
          return const LoanDetailsErrorWidget();
        } else if (state.status == LoanDetailStatus.noData) {
          return const LoanDetailsInitialWidget();
        }
        return const LoanDetailsInitialWidget();
      },
    );
  }
}
