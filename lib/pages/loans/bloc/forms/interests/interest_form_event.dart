part of 'interest_form_bloc.dart';

@immutable
abstract class InterestFormEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetInterests extends InterestFormEvent {
  GetInterests(this.idSelected);

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class GetInterest extends InterestFormEvent {
  GetInterest(this.idSelected);

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class PutInterest extends InterestFormEvent {
  PutInterest(this.interest, this.idSelected);

  final int idSelected;
  final InterestModel interest;

  @override
  List<Object?> get props => [
        interest,
        idSelected,
      ];
}

class PostInterest extends InterestFormEvent {
  PostInterest(this.idSelected, this.interest);

  final int idSelected;
  final InterestModel interest;

  @override
  List<Object?> get props => [
        idSelected,
        interest,
      ];
}

class UpdateInterest extends InterestFormEvent {
  UpdateInterest(this.idSelected, this.interest);

  final int idSelected;
  final InterestModel interest;

  @override
  List<Object?> get props => [idSelected, interest];
}

class DeleteInterest extends InterestFormEvent {
  DeleteInterest(this.idSelected);

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class SelectInterest extends InterestFormEvent {
  SelectInterest(this.idSelected);

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class Success extends InterestFormEvent {}

class ShowFixedRate extends InterestFormEvent {}

class ShowPercentage extends InterestFormEvent {}
