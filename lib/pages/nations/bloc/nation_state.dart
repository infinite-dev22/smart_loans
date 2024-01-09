part of 'nation_bloc.dart';

enum NationStatus { initial, success, error, loading, selected, noData }

extension NationStatusX on NationStatus {
  bool get isInitial => this == NationStatus.initial;

  bool get isSuccess => this == NationStatus.success;

  bool get isError => this == NationStatus.error;

  bool get isLoading => this == NationStatus.loading;

  bool get isSelected => this == NationStatus.selected;
}

class NationState extends Equatable {
  final List<NationModel>? nations;
  final NationModel? nation;
  final NationStatus status;
  final int? idSelected;

  const NationState({
    List<NationModel>? nations,
    this.nation,
    this.status = NationStatus.initial,
    this.idSelected = 0,
  }) : nations = nations ?? const [];

  @override
  List<Object?> get props => [nations, nation, status, idSelected];

  // Copy state

  NationState copyWith({
    List<NationModel>? nations,
    NationModel? nation,
    NationStatus? status,
    int? idSelected,
  }) {
    return NationState(
      nations: nations ?? this.nations,
      nation: nation ?? this.nation,
      status: status ?? this.status,
      idSelected: idSelected ?? this.idSelected,
    );
  }
}

class NationsInitial extends NationState {}

class NationsLoading extends NationState {}

class NationsSuccess extends NationState {
  const NationsSuccess(nations);

  @override
  List<Object?> get props => [nations];
}

class NationsError extends NationState {}

class NationsNoData extends NationState {}

class NationInitial extends NationState {}

class NationLoading extends NationState {}

class NationSuccess extends NationState {
  const NationSuccess(nation);

  @override
  List<Object?> get props => [nation];
}

class NationPosted extends NationState {}

class NationError extends NationState {}

class NationNoData extends NationState {}
