part of 'nation_bloc.dart';

abstract class NationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetNations extends NationEvent {}

class GetNation extends NationEvent {
  GetNation(this.idSelected);

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class CreateNation extends NationEvent {
  CreateNation(this.nation);

  final NationModel nation;

  @override
  List<Object?> get props => [nation];
}

class UpdateNation extends NationEvent {
  UpdateNation(this.idSelected, this.nation);

  final int idSelected;
  final NationModel nation;

  @override
  List<Object?> get props => [idSelected, nation];
}

class DeleteNation extends NationEvent {
  DeleteNation(this.idSelected);

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class SelectNation extends NationEvent {
  SelectNation(this.idSelected);

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class Success extends NationEvent {}
