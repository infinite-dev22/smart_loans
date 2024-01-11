part of 'repayment_cycle_bloc.dart';

@immutable
abstract class RepaymentCycleEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetRepaymentCycles extends RepaymentCycleEvent {}

class GetRepaymentCycle extends RepaymentCycleEvent {
  GetRepaymentCycle(this.idSelected);

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class PostRepaymentCycle extends RepaymentCycleEvent {
  PostRepaymentCycle(this.repaymentCycle);

  final RepaymentCycleModel repaymentCycle;

  @override
  List<Object?> get props => [repaymentCycle];
}

class PutRepaymentCycle extends RepaymentCycleEvent {
  PutRepaymentCycle(this.repaymentCycle, this.idSelected);

  final int idSelected;
  final RepaymentCycleModel repaymentCycle;

  @override
  List<Object?> get props => [
        repaymentCycle,
        idSelected,
      ];
}

class DeleteRepaymentCycle extends RepaymentCycleEvent {
  DeleteRepaymentCycle(this.idSelected);

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class DeleteMultipleRepaymentCycle extends RepaymentCycleEvent {
  DeleteMultipleRepaymentCycle(this.idsSelected);

  final List<int> idsSelected;

  @override
  List<Object?> get props => [idsSelected];
}
