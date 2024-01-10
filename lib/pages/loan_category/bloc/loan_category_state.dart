part of 'loan_category_bloc.dart';

enum LoanCategoryStatus { initial, success, error, loading, selected, noData }

extension LoanCategoryStatusX on LoanCategoryStatus {
  bool get isInitial => this == LoanCategoryStatus.initial;

  bool get isSuccess => this == LoanCategoryStatus.success;

  bool get isError => this == LoanCategoryStatus.error;

  bool get isLoading => this == LoanCategoryStatus.loading;

  bool get isSelected => this == LoanCategoryStatus.selected;
}

class LoanCategoryState extends Equatable {
  final List<LoanCategoryModel>? loanCategories;
  final LoanCategoryModel? loanCategory;
  final LoanCategoryStatus status;
  final int? idSelected;

  const LoanCategoryState({
    List<LoanCategoryModel>? loanCategories,
    this.loanCategory,
    this.status = LoanCategoryStatus.initial,
    this.idSelected = 0,
  }) : loanCategories = loanCategories ?? const [];

  @override
  List<Object?> get props => [loanCategories, loanCategory, status, idSelected];

  // Copy state

  LoanCategoryState copyWith({
    List<LoanCategoryModel>? loanCategories,
    LoanCategoryModel? loanCategory,
    LoanCategoryStatus? status,
    int? idSelected,
  }) {
    return LoanCategoryState(
      loanCategories: loanCategories ?? this.loanCategories,
      loanCategory: loanCategory ?? this.loanCategory,
      status: status ?? this.status,
      idSelected: idSelected ?? this.idSelected,
    );
  }
}

class CurrenciesInitial extends LoanCategoryState {}

class CurrenciesLoading extends LoanCategoryState {}

class CurrenciesSuccess extends LoanCategoryState {
  const CurrenciesSuccess(loanCategories);

  @override
  List<Object?> get props => [loanCategories];
}

class CurrenciesError extends LoanCategoryState {}

class CurrenciesNoData extends LoanCategoryState {}

class LoanCategoryInitial extends LoanCategoryState {}

class LoanCategoryLoading extends LoanCategoryState {}

class LoanCategorySuccess extends LoanCategoryState {
  const LoanCategorySuccess(loanCategory);

  @override
  List<Object?> get props => [loanCategory];
}

class LoanCategoryPosted extends LoanCategoryState {}

class LoanCategoryError extends LoanCategoryState {}

class LoanCategoryNoData extends LoanCategoryState {}
