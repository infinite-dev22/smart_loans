part of 'currency_bloc.dart';

enum CurrencyStatus { initial, success, error, loading, selected, noData }

extension CurrencyStatusX on CurrencyStatus {
  bool get isInitial => this == CurrencyStatus.initial;

  bool get isSuccess => this == CurrencyStatus.success;

  bool get isError => this == CurrencyStatus.error;

  bool get isLoading => this == CurrencyStatus.loading;

  bool get isSelected => this == CurrencyStatus.selected;
}

class CurrencyState extends Equatable {
  final List<CurrencyModel>? currencies;
  final CurrencyModel? currency;
  final CurrencyStatus status;
  final int? idSelected;

  const CurrencyState({
    List<CurrencyModel>? currencies,
    this.currency,
    this.status = CurrencyStatus.initial,
    this.idSelected = 0,
  }) : currencies = currencies ?? const [];

  @override
  List<Object?> get props => [currencies, currency, status, idSelected];

  // Copy state

  CurrencyState copyWith({
    List<CurrencyModel>? currencies,
    CurrencyModel? currency,
    CurrencyStatus? status,
    int? idSelected,
  }) {
    return CurrencyState(
      currencies: currencies ?? this.currencies,
      currency: currency ?? this.currency,
      status: status ?? this.status,
      idSelected: idSelected ?? this.idSelected,
    );
  }
}

class CurrenciesInitial extends CurrencyState {}

class CurrenciesLoading extends CurrencyState {}

class CurrenciesSuccess extends CurrencyState {
  const CurrenciesSuccess(currencies);

  @override
  List<Object?> get props => [currencies];
}

class CurrenciesError extends CurrencyState {}

class CurrenciesNoData extends CurrencyState {}

class CurrencyInitial extends CurrencyState {}

class CurrencyLoading extends CurrencyState {}

class CurrencySuccess extends CurrencyState {
  const CurrencySuccess(currency);

  @override
  List<Object?> get props => [currency];
}

class CurrencyPosted extends CurrencyState {}

class CurrencyError extends CurrencyState {}

class CurrencyNoData extends CurrencyState {}
