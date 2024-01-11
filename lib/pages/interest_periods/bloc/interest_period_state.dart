part of 'interest_period_bloc.dart';

enum InterestPeriodStatus {
  initial,
  success,
  error,
  loading,
  selected,
  noData,
  fixedRate,
  percentage
}

extension InterestPeriodStatusX on InterestPeriodStatus {
  bool get isInitial => this == InterestPeriodStatus.initial;

  bool get isSuccess => this == InterestPeriodStatus.success;

  bool get isError => this == InterestPeriodStatus.error;

  bool get isLoading => this == InterestPeriodStatus.loading;

  bool get isSelected => this == InterestPeriodStatus.selected;

  bool get showFixedRate => this == InterestPeriodStatus.fixedRate;

  bool get showPercentage => this == InterestPeriodStatus.percentage;
}

//
@immutable
class InterestPeriodState extends Equatable {
  final InterestPeriodModel? interestPeriod;
  final List<InterestPeriodModel>? interestPeriods;
  final InterestPeriodStatus status;
  final int? idSelected;

  const InterestPeriodState({
    this.interestPeriod,
    this.interestPeriods,
    this.status = InterestPeriodStatus.initial,
    this.idSelected,
  });

  @override
  List<Object?> get props =>
      [interestPeriod, interestPeriods, status, idSelected];

  // Copy state.
  InterestPeriodState copyWith({
    InterestPeriodModel? interestPeriod,
    final List<InterestPeriodModel>? interestPeriods,
    InterestPeriodStatus? status,
    int? idSelected,
  }) {
    return InterestPeriodState(
      interestPeriod: interestPeriod ?? this.interestPeriod,
      interestPeriods: interestPeriods ?? this.interestPeriods,
      status: status ?? this.status,
      idSelected: idSelected ?? this.idSelected,
    );
  }
}

class Initial extends InterestPeriodState {}

class Loading extends InterestPeriodState {}

class Success extends InterestPeriodState {
  const Success(interestPeriod);

  @override
  List<Object?> get props => [interestPeriod];
}

class Error extends InterestPeriodState {}

class NoData extends InterestPeriodState {}

class ShowCompany extends InterestPeriodState {}

class ShowIndividual extends InterestPeriodState {}
