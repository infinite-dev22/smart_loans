import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_loans/config/responsive.dart';
import 'package:smart_loans/data_source/models/loan_model.dart';
import 'package:smart_loans/pages/loans/bloc/details/loan_details_bloc.dart';
import 'package:smart_loans/pages/loans/widgets/details/loans_details_success_widget/desktop.dart';
import 'package:smart_loans/pages/loans/widgets/details/loans_details_success_widget/mobile.dart';
import 'package:smart_loans/pages/loans/widgets/details/loans_details_success_widget/tablet.dart';
import 'package:smart_loans/pages/loans/widgets/error/loan_details_error_widget.dart';
import 'package:smart_loans/pages/loans/widgets/initial/loan_details_initial_widget.dart';
import 'package:smart_loans/pages/loans/widgets/loading/loan_details_loading_widget.dart';

class LoanDetailsPageLayout extends StatelessWidget {
  const LoanDetailsPageLayout({super.key, required this.loanId});

  final int loanId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoanDetailBloc, LoanDetailState>(
      builder: (context, state) {
        if (state.status == LoanDetailStatus.initial) {
          context.read<LoanDetailBloc>().add(GetLoanDetail(loanId));
        } else if (state.status == LoanDetailStatus.success) {
          var loan = context.read<LoanDetailBloc>().state.loan;
          var loanDetail = context.read<LoanDetailBloc>().state.loanDetail;
          return SingleChildScrollView(
            child: Responsive(
              mobile: LoanDetailSuccessMobile(
                loan: loan!,
                loanDetail: loanDetail!,
              ),
              tablet: LoanDetailSuccessTablet(
                loan: loan,
                loanDetail: loanDetail,
              ),
              desktop: LoanDetailSuccessDesktop(
                loan: loan,
                loanDetail: loanDetail,
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
