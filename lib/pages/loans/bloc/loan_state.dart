part of 'loan_bloc.dart';

abstract class LoanState extends Equatable {
  const LoanState();
}

class LoanInitial extends LoanState {
  @override
  List<Object> get props => [];
}
