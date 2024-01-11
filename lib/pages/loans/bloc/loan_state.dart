part of 'loan_bloc.dart';

enum LoanStatus {
  initial,
  success,
  error,
  loading,
  selected,
  noData,
}

enum InterestStatus {
  initial,
  success,
  error,
  loading,
  selected,
  noData,
}

extension LoanStatusX on LoanStatus {
  bool get isInitial => this == LoanStatus.initial;

  bool get isSuccess => this == LoanStatus.success;

  bool get isError => this == LoanStatus.error;

  bool get isLoading => this == LoanStatus.loading;

  bool get isSelected => this == LoanStatus.selected;
}

extension InterestStatusX on InterestStatus {
  bool get initial => this == InterestStatus.initial;

  bool get isSuccess => this == InterestStatus.success;

  bool get isError => this == InterestStatus.error;

  bool get isLoading => this == InterestStatus.loading;

  bool get isSelected => this == InterestStatus.selected;
}

class LoanState extends Equatable {
  final List<LoanModel>? loans;
  final List<InterestModel>? interests;
  final LoanModel? loan;
  final InterestModel? interest;
  final LoanStatus status;
  final InterestStatus interestStatus;
  final int? idSelected;
  final int? interestIdSelected;

  const LoanState({
    List<LoanModel>? loans,
    List<InterestModel>? interests,
    this.loan,
    this.interest,
    this.status = LoanStatus.initial,
    this.interestStatus = InterestStatus.initial,
    this.idSelected = 0,
    this.interestIdSelected = 0,
  })  : loans = loans ?? const [],
        interests = interests ?? const [];

  @override
  List<Object?> get props => [
        loans,
        interests,
        loan,
        interest,
        status,
        interestStatus,
        idSelected,
        interestIdSelected
      ];

  // Copy state.
  LoanState copyWith({
    List<LoanModel>? loans,
    List<InterestModel>? interests,
    LoanModel? loan,
    InterestModel? interest,
    LoanStatus? status,
    InterestStatus? interestStatus,
    int? idSelected,
    int? interestIdSelected,
  }) {
    return LoanState(
      loans: loans ?? this.loans,
      interests: interests ?? this.interests,
      loan: loan ?? this.loan,
      interest: interest ?? this.interest,
      status: status ?? this.status,
      interestStatus: interestStatus ?? this.interestStatus,
      idSelected: idSelected ?? this.idSelected,
      interestIdSelected: interestIdSelected ?? this.interestIdSelected,
    );
  }
}

class LoansInitial extends LoanState {}

class LoansLoading extends LoanState {}

class LoansSuccess extends LoanState {
  const LoansSuccess(loans);

  @override
  List<Object?> get props => [loans];
}

class LoansError extends LoanState {}

class LoansNoData extends LoanState {}

class LoanInitial extends LoanState {}

class LoanLoading extends LoanState {}

class LoanSuccess extends LoanState {
  const LoanSuccess(loan);

  @override
  List<Object?> get props => [loan];
}

class LoanPosted extends LoanState {}

class LoanError extends LoanState {}

class LoanNoData extends LoanState {}

class InterestInitial extends LoanState {}

class InterestLoading extends LoanState {}

class InterestSuccess extends LoanState {}

class InterestPosted extends LoanState {}

class InterestError extends LoanState {}

class InterestNoData extends LoanState {}
