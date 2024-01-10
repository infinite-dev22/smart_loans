part of 'currency_bloc.dart';

abstract class CurrencyEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetCurrencies extends CurrencyEvent {}

class GetCurrency extends CurrencyEvent {
  GetCurrency(this.idSelected);

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class CreateCurrency extends CurrencyEvent {
  CreateCurrency(this.currency);

  final CurrencyModel currency;

  @override
  List<Object?> get props => [currency];
}

class UpdateCurrency extends CurrencyEvent {
  UpdateCurrency(this.idSelected, this.currency);

  final int idSelected;
  final CurrencyModel currency;

  @override
  List<Object?> get props => [idSelected, currency];
}

class DeleteCurrency extends CurrencyEvent {
  DeleteCurrency(this.idSelected);

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class SelectCurrency extends CurrencyEvent {
  SelectCurrency(this.idSelected);

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class Success extends CurrencyEvent {}
