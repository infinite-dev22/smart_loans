part of 'branch_bloc.dart';

abstract class BranchEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetBranches extends BranchEvent {}

class GetBranch extends BranchEvent {
  GetBranch(this.idSelected);

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class CreateBranch extends BranchEvent {
  CreateBranch(this.branch);

  final BranchModel branch;

  @override
  List<Object?> get props => [branch];
}

class UpdateBranch extends BranchEvent {
  UpdateBranch(this.idSelected, this.branch);

  final int idSelected;
  final BranchModel branch;

  @override
  List<Object?> get props => [idSelected, branch];
}

class DeleteBranch extends BranchEvent {
  DeleteBranch(this.idSelected);

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class SelectBranch extends BranchEvent {
  SelectBranch(this.idSelected);

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class Success extends BranchEvent {}
