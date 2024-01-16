part of 'loan_details_bloc.dart';

enum LoanDetailStatus { initial, success, error, loading, selected, noData }

extension LoanDetailStatusX on LoanDetailStatus {
  bool get isInitial => this == LoanDetailStatus.initial;

  bool get isSuccess => this == LoanDetailStatus.success;

  bool get isError => this == LoanDetailStatus.error;

  bool get isLoading => this == LoanDetailStatus.loading;

  bool get isSelected => this == LoanDetailStatus.selected;
}

class LoanDetailState extends Equatable {
  final List<LoanModel>? loans;
  final LoanModel? loan;
  final LoanTypeModel? loanType;
  final LoanCategoryModel? loanCategory;
  final LoanStatusModel? loanStatus;
  final CurrencyModel? currency;
  final BranchModel? branch;
  final LoanDetailStatus status;
  final RepaymentCycleModel? repaymentCycle;
  final LoanDetailModel? loanDetail;
  final int? idSelected;

  const LoanDetailState({
    List<LoanModel>? loans,
    this.loan,
    this.loanType,
    this.loanCategory,
    this.loanStatus,
    this.currency,
    this.branch,
    this.repaymentCycle,
    this.loanDetail,
    this.status = LoanDetailStatus.initial,
    this.idSelected = 0,
  }) : loans = loans ?? const [];

  @override
  List<Object?> get props => [
        loans,
        loan,
        loanType,
        loanCategory,
        loanStatus,
        currency,
        branch,
        repaymentCycle,
        loanDetail,
        status,
        idSelected,
      ];

  // Copy state.
  LoanDetailState copyWith({
    List<LoanModel>? loans,
    LoanModel? loan,
    LoanTypeModel? loanType,
    LoanCategoryModel? loanCategory,
    LoanStatusModel? loanStatus,
    CurrencyModel? currency,
    BranchModel? branch,
    RepaymentCycleModel? repaymentCycle,
    LoanDetailModel? loanDetail,
    LoanDetailStatus? status,
    int? idSelected,
  }) {
    return LoanDetailState(
      loans: loans ?? this.loans,
      loan: loan ?? this.loan,
      loanType: loanType ?? this.loanType,
      loanCategory: loanCategory ?? this.loanCategory,
      loanStatus: loanStatus ?? this.loanStatus,
      currency: currency ?? this.currency,
      branch: branch ?? this.branch,
      repaymentCycle: repaymentCycle ?? this.repaymentCycle,
      loanDetail: loanDetail ?? this.loanDetail,
      status: status ?? this.status,
      idSelected: idSelected ?? this.idSelected,
    );
  }
}

class LoanDetailsInitial extends LoanDetailState {}

class LoanDetailsLoading extends LoanDetailState {}

class LoanDetailsSuccess extends LoanDetailState {
  const LoanDetailsSuccess(loans);

  @override
  List<Object?> get props => [loans];
}

class LoanDetailsError extends LoanDetailState {}

class LoanDetailsNoData extends LoanDetailState {}

class LoanDetailInitial extends LoanDetailState {}

class LoanDetailLoading extends LoanDetailState {}

class LoanDetailSuccess extends LoanDetailState {
  const LoanDetailSuccess(loan);

  @override
  List<Object?> get props => [loan];
}

class LoanDetailPosted extends LoanDetailState {}

class LoanDetailError extends LoanDetailState {}

class LoanDetailNoData extends LoanDetailState {}
