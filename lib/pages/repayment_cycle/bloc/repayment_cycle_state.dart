part of 'repayment_cycle_bloc.dart';

enum RepaymentCycleStatus {
  initial,
  success,
  error,
  loading,
  selected,
  noData,
  fixedRate,
  percentage
}

extension RepaymentCycleStatusX on RepaymentCycleStatus {
  bool get isInitial => this == RepaymentCycleStatus.initial;

  bool get isSuccess => this == RepaymentCycleStatus.success;

  bool get isError => this == RepaymentCycleStatus.error;

  bool get isLoading => this == RepaymentCycleStatus.loading;

  bool get isSelected => this == RepaymentCycleStatus.selected;

  bool get showFixedRate => this == RepaymentCycleStatus.fixedRate;

  bool get showPercentage => this == RepaymentCycleStatus.percentage;
}

@immutable
class RepaymentCycleState extends Equatable {
  final RepaymentCycleModel? repaymentCycle;
  final List<RepaymentCycleModel>? repaymentCycles;
  final RepaymentCycleStatus status;
  final int? idSelected;

  const RepaymentCycleState({
    this.repaymentCycle,
    this.repaymentCycles,
    this.status = RepaymentCycleStatus.initial,
    this.idSelected,
  });

  @override
  List<Object?> get props =>
      [repaymentCycle, repaymentCycles, status, idSelected];

  RepaymentCycleState copyWith({
    RepaymentCycleModel? repaymentCycle,
    final List<RepaymentCycleModel>? repaymentCycles,
    RepaymentCycleStatus? status,
    int? idSelected,
  }) {
    return RepaymentCycleState(
      repaymentCycle: repaymentCycle ?? this.repaymentCycle,
      repaymentCycles: repaymentCycles ?? this.repaymentCycles,
      status: status ?? this.status,
      idSelected: idSelected ?? this.idSelected,
    );
  }
}

class Initial extends RepaymentCycleState {}

class Loading extends RepaymentCycleState {}

class Success extends RepaymentCycleState {
  const Success(repaymentCycle);

  @override
  List<Object?> get props => [repaymentCycle];
}

class Error extends RepaymentCycleState {}

class NoData extends RepaymentCycleState {}
