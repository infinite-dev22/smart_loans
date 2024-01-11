part of 'interest_method_bloc.dart';

enum InterestMethodStatus {
  initial,
  success,
  error,
  loading,
  selected,
  noData,
  fixedRate,
  percentage
}

extension InterestMethodStatusX on InterestMethodStatus {
  bool get isInitial => this == InterestMethodStatus.initial;

  bool get isSuccess => this == InterestMethodStatus.success;

  bool get isError => this == InterestMethodStatus.error;

  bool get isLoading => this == InterestMethodStatus.loading;

  bool get isSelected => this == InterestMethodStatus.selected;

  bool get showFixedRate => this == InterestMethodStatus.fixedRate;

  bool get showPercentage => this == InterestMethodStatus.percentage;
}

//
@immutable
class InterestMethodState extends Equatable {
  final InterestMethodModel? interestMethod;
  final List<InterestMethodModel>? interestMethods;
  final InterestMethodStatus status;
  final int? idSelected;

  const InterestMethodState({
    this.interestMethod,
    this.interestMethods,
    this.status = InterestMethodStatus.initial,
    this.idSelected,
  });

  @override
  List<Object?> get props =>
      [interestMethod, interestMethods, status, idSelected];

  // Copy state.
  InterestMethodState copyWith({
    InterestMethodModel? interestMethod,
    final List<InterestMethodModel>? interestMethods,
    InterestMethodStatus? status,
    int? idSelected,
  }) {
    return InterestMethodState(
      interestMethod: interestMethod ?? this.interestMethod,
      interestMethods: interestMethods ?? this.interestMethods,
      status: status ?? this.status,
      idSelected: idSelected ?? this.idSelected,
    );
  }
}

class Initial extends InterestMethodState {}

class Success extends InterestMethodState {
  const Success(interestMethod);

  @override
  List<Object?> get props => [interestMethod];
}

class Loading extends InterestMethodState {}

class Error extends InterestMethodState {}

class NoData extends InterestMethodState {}

class ShowCompany extends InterestMethodState {}

class ShowIndividual extends InterestMethodState {}
