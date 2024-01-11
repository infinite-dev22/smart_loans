part of 'interest_period_bloc.dart';

@immutable
abstract class InterestPeriodEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetInterestPeriods extends InterestPeriodEvent {}

class GetInterestPeriod extends InterestPeriodEvent {
  GetInterestPeriod(this.idSelected);

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class PostInterestPeriod extends InterestPeriodEvent {
  PostInterestPeriod(this.interestPeriod);

  final InterestPeriodModel interestPeriod;

  @override
  List<Object?> get props => [interestPeriod];
}

class PutInterestPeriod extends InterestPeriodEvent {
  PutInterestPeriod(this.interestPeriod, this.idSelected);

  final int idSelected;
  final InterestPeriodModel interestPeriod;

  @override
  List<Object?> get props => [
        interestPeriod,
        idSelected,
      ];
}

class DeleteInterestPeriod extends InterestPeriodEvent {
  DeleteInterestPeriod(this.idSelected);

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class DeleteMultipleInterestPeriod extends InterestPeriodEvent {
  DeleteMultipleInterestPeriod(this.idsSelected);

  final List<int> idsSelected;

  @override
  List<Object?> get props => [idsSelected];
}

class SetFixedRate extends InterestPeriodEvent {}

class SetPercentage extends InterestPeriodEvent {}
