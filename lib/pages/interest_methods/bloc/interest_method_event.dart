part of 'interest_method_bloc.dart';

@immutable
abstract class InterestMethodEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetInterestMethods extends InterestMethodEvent {}

class GetInterestMethod extends InterestMethodEvent {
  GetInterestMethod(this.idSelected);

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class PutInterestMethod extends InterestMethodEvent {
  PutInterestMethod(this.interestMethod, this.idSelected);

  final int idSelected;
  final InterestMethodModel interestMethod;

  @override
  List<Object?> get props => [
        interestMethod,
        idSelected,
      ];
}

class PostInterestMethod extends InterestMethodEvent {
  PostInterestMethod(this.interestMethod);

  final InterestMethodModel interestMethod;

  @override
  List<Object?> get props => [interestMethod];
}

class SetFixedRate extends InterestMethodEvent {}

class SetPercentage extends InterestMethodEvent {}
