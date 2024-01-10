part of 'loan_category_bloc.dart';

abstract class LoanCategoryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetLoanCategories extends LoanCategoryEvent {}

class GetLoanCategory extends LoanCategoryEvent {
  GetLoanCategory(this.idSelected);

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class CreateLoanCategory extends LoanCategoryEvent {
  CreateLoanCategory(this.loanCategory);

  final LoanCategoryModel loanCategory;

  @override
  List<Object?> get props => [loanCategory];
}

class UpdateLoanCategory extends LoanCategoryEvent {
  UpdateLoanCategory(this.idSelected, this.loanCategory);

  final int idSelected;
  final LoanCategoryModel loanCategory;

  @override
  List<Object?> get props => [idSelected, loanCategory];
}

class DeleteLoanCategory extends LoanCategoryEvent {
  DeleteLoanCategory(this.idSelected);

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class SelectLoanCategory extends LoanCategoryEvent {
  SelectLoanCategory(this.idSelected);

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class Success extends LoanCategoryEvent {}
