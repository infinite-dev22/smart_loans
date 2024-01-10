import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:smart_loans/data_source/models/currency_model.dart';
import 'package:smart_loans/data_source/repositories/currency_repo.dart';

part 'currency_event.dart';
part 'currency_state.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  CurrencyBloc() : super(const CurrencyState()) {
    on<GetCurrencies>(_mapGetCurrenciesEventToState);
    on<GetCurrency>(_mapGetCurrencyEventToState);
    on<CreateCurrency>(_mapCreateCurrencyCreateClientEventToState);
    on<UpdateCurrency>(_mapUpdateCurrencyEventToState);
    on<DeleteCurrency>(_mapDeleteCurrencyEventToState);
    on<SelectCurrency>(_mapSelectCurrencyEventToState);
  }

  Future<FutureOr<void>> _mapGetCurrenciesEventToState(
      GetCurrencies event, Emitter<CurrencyState> emit) async {
    emit(state.copyWith(status: CurrencyStatus.loading));
    await CurrencyRepo.fetchAll().then((currencies) {
      emit(state.copyWith(
          status: CurrencyStatus.success, currencies: currencies));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: CurrencyStatus.error));
    });
  }

  Future<FutureOr<void>> _mapGetCurrencyEventToState(
      GetCurrency event, Emitter<CurrencyState> emit) async {
    emit(state.copyWith(status: CurrencyStatus.loading));

    try {
      var currency = await CurrencyRepo.fetch(event.idSelected);
      emit(state.copyWith(status: CurrencyStatus.success, currency: currency));
    } catch (e) {
      emit(state.copyWith(status: CurrencyStatus.error));
    }
  }

  Future<FutureOr<void>> _mapCreateCurrencyCreateClientEventToState(
      CreateCurrency event, Emitter<CurrencyState> emit) async {
    emit(state.copyWith(status: CurrencyStatus.loading));
    try {
      var currency = await CurrencyRepo.post(event.currency);

      emit(state.copyWith(status: CurrencyStatus.success, currency: currency));
    } catch (e) {
      emit(state.copyWith(status: CurrencyStatus.error));
    }
  }

  Future<FutureOr<void>> _mapUpdateCurrencyEventToState(
      UpdateCurrency event, Emitter<CurrencyState> emit) async {
    emit(state.copyWith(status: CurrencyStatus.loading));
    try {
      var currency = await CurrencyRepo.put(event.currency, event.idSelected);

      emit(state.copyWith(status: CurrencyStatus.success, currency: currency));
    } catch (e) {
      emit(state.copyWith(status: CurrencyStatus.error));
    }
  }

  FutureOr<void> _mapDeleteCurrencyEventToState(
      DeleteCurrency event, Emitter<CurrencyState> emit) {
    emit(state.copyWith(status: CurrencyStatus.loading));
    try {
      emit(state.copyWith(status: CurrencyStatus.success));
    } catch (e) {
      emit(state.copyWith(status: CurrencyStatus.error));
    }
  }

  FutureOr<void> _mapSelectCurrencyEventToState(
      SelectCurrency event, Emitter<CurrencyState> emit) {
    emit(state.copyWith(status: CurrencyStatus.loading));
    try {
      emit(state.copyWith(status: CurrencyStatus.success, idSelected: null));
    } catch (e) {
      emit(state.copyWith(status: CurrencyStatus.error));
    }
  }

  @override
  void onChange(Change<CurrencyState> change) {
    super.onChange(change);
    if (kDebugMode) {
      print("Change: $change");
    }
  }

  @override
  void onEvent(CurrencyEvent event) {
    super.onEvent(event);
    if (kDebugMode) {
      print("Event: $event");
    }
  }

  @override
  void onTransition(Transition<CurrencyEvent, CurrencyState> transition) {
    super.onTransition(transition);
    if (kDebugMode) {
      print("Transition: $transition");
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    if (kDebugMode) {
      print("Error: $error");
      print("StackTrace: $stackTrace");
    }
  }
}
