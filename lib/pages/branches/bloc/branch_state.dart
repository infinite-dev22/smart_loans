part of 'branch_bloc.dart';

enum BranchStatus { initial, success, error, loading, selected, noData }

extension BranchStatusX on BranchStatus {
  bool get isInitial => this == BranchStatus.initial;

  bool get isSuccess => this == BranchStatus.success;

  bool get isError => this == BranchStatus.error;

  bool get isLoading => this == BranchStatus.loading;

  bool get isSelected => this == BranchStatus.selected;
}

class BranchState extends Equatable {
  final List<BranchModel>? branches;
  final BranchModel? branch;
  final BranchStatus status;
  final int? idSelected;

  const BranchState({
    List<BranchModel>? branches,
    this.branch,
    this.status = BranchStatus.initial,
    this.idSelected = 0,
  }) : branches = branches ?? const [];

  @override
  List<Object?> get props => [branches, branch, status, idSelected];

  // Copy state

  BranchState copyWith({
    List<BranchModel>? branches,
    BranchModel? branch,
    BranchStatus? status,
    int? idSelected,
  }) {
    return BranchState(
      branches: branches ?? this.branches,
      branch: branch ?? this.branch,
      status: status ?? this.status,
      idSelected: idSelected ?? this.idSelected,
    );
  }
}

class BranchesInitial extends BranchState {}

class BranchesLoading extends BranchState {}

class BranchesSuccess extends BranchState {
  const BranchesSuccess(branches);

  @override
  List<Object?> get props => [branches];
}

class BranchesError extends BranchState {}

class BranchesNoData extends BranchState {}

class BranchInitial extends BranchState {}

class BranchLoading extends BranchState {}

class BranchSuccess extends BranchState {
  const BranchSuccess(branch);

  @override
  List<Object?> get props => [branch];
}

class BranchPosted extends BranchState {}

class BranchError extends BranchState {}

class BranchNoData extends BranchState {}
