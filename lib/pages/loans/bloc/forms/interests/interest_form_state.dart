part of 'interest_form_bloc.dart';

enum InterestFormStatus {
  initial,
  success,
  error,
  loading,
  selected,
  noData,
  fixedRate,
  percentage
}

extension InterestFormStatusX on InterestFormStatus {
  bool get isInitial => this == InterestFormStatus.initial;

  bool get isSuccess => this == InterestFormStatus.success;

  bool get isError => this == InterestFormStatus.error;

  bool get isLoading => this == InterestFormStatus.loading;

  bool get isSelected => this == InterestFormStatus.selected;

  bool get showFixedRate => this == InterestFormStatus.fixedRate;

  bool get showPercentage => this == InterestFormStatus.percentage;
}

@immutable
class InterestFormState extends Equatable {
  final InterestModel? interest;
  final List<InterestModel>? interests;
  final InterestFormStatus status;
  final int? idSelected;

  const InterestFormState({
    this.interest,
    this.interests,
    this.status = InterestFormStatus.initial,
    this.idSelected,
  });

  @override
  List<Object?> get props => [interest, interests, status, idSelected];

  InterestFormState copyWith({
    InterestModel? interest,
    final List<InterestModel>? interests,
    InterestFormStatus? status,
    int? idSelected,
  }) {
    return InterestFormState(
      interest: interest ?? this.interest,
      interests: interests ?? this.interests,
      status: status ?? this.status,
      idSelected: idSelected ?? this.idSelected,
    );
  }
}

class InterestInitial extends InterestFormState {}

class InterestLoading extends InterestFormState {}

class InterestSuccess extends InterestFormState {
  const InterestSuccess(interest);

  @override
  List<Object?> get props => [interest];
}

class InterestError extends InterestFormState {}

class InterestNoData extends InterestFormState {}
