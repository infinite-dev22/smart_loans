import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:smart_loans/data_source/models/loan_status_model.dart';
import 'package:smart_loans/data_source/repositories/loan_status_repo.dart';

part 'loan_status_event.dart';
part 'loan_status_state.dart';

class LoanStatusBloc extends Bloc<LoanStatusEvent, LoanStatusState> {
  LoanStatusBloc() : super(const LoanStatusState()) {
    on<GetCurrencies>(_mapGetCurrenciesEventToState);
    on<GetLoanStatus>(_mapGetLoanStatusEventToState);
    on<CreateLoanStatus>(_mapCreateLoanStatusCreateClientEventToState);
    on<UpdateLoanStatus>(_mapUpdateLoanStatusEventToState);
    on<DeleteLoanStatus>(_mapDeleteLoanStatusEventToState);
    on<SelectLoanStatus>(_mapSelectLoanStatusEventToState);
  }

  Future<FutureOr<void>> _mapGetCurrenciesEventToState(
      GetCurrencies event, Emitter<LoanStatusState> emit) async {
    emit(state.copyWith(status: LoanStatusStatus.loading));
    await LoanStatusRepo.fetchAll().then((loanStatuses) {
      emit(state.copyWith(
          status: LoanStatusStatus.success, loanStatuses: loanStatuses));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: LoanStatusStatus.error));
    });
  }

  Future<FutureOr<void>> _mapGetLoanStatusEventToState(
      GetLoanStatus event, Emitter<LoanStatusState> emit) async {
    emit(state.copyWith(status: LoanStatusStatus.loading));

    try {
      var loanStatus = await LoanStatusRepo.fetch(event.idSelected);
      emit(state.copyWith(
          status: LoanStatusStatus.success, loanStatus: loanStatus));
    } catch (e) {
      emit(state.copyWith(status: LoanStatusStatus.error));
    }
  }

  Future<FutureOr<void>> _mapCreateLoanStatusCreateClientEventToState(
      CreateLoanStatus event, Emitter<LoanStatusState> emit) async {
    emit(state.copyWith(status: LoanStatusStatus.loading));
    try {
      var loanStatus = await LoanStatusRepo.post(event.loanStatus);

      emit(state.copyWith(
          status: LoanStatusStatus.success, loanStatus: loanStatus));
    } catch (e) {
      emit(state.copyWith(status: LoanStatusStatus.error));
    }
  }

  Future<FutureOr<void>> _mapUpdateLoanStatusEventToState(
      UpdateLoanStatus event, Emitter<LoanStatusState> emit) async {
    emit(state.copyWith(status: LoanStatusStatus.loading));
    try {
      var loanStatus =
          await LoanStatusRepo.put(event.loanStatus, event.idSelected);

      emit(state.copyWith(
          status: LoanStatusStatus.success, loanStatus: loanStatus));
    } catch (e) {
      emit(state.copyWith(status: LoanStatusStatus.error));
    }
  }

  FutureOr<void> _mapDeleteLoanStatusEventToState(
      DeleteLoanStatus event, Emitter<LoanStatusState> emit) {
    emit(state.copyWith(status: LoanStatusStatus.loading));
    try {
      emit(state.copyWith(status: LoanStatusStatus.success));
    } catch (e) {
      emit(state.copyWith(status: LoanStatusStatus.error));
    }
  }

  FutureOr<void> _mapSelectLoanStatusEventToState(
      SelectLoanStatus event, Emitter<LoanStatusState> emit) {
    emit(state.copyWith(status: LoanStatusStatus.loading));
    try {
      emit(state.copyWith(status: LoanStatusStatus.success, idSelected: null));
    } catch (e) {
      emit(state.copyWith(status: LoanStatusStatus.error));
    }
  }

  @override
  void onChange(Change<LoanStatusState> change) {
    super.onChange(change);
    if (kDebugMode) {
      print("Change: $change");
    }
  }

  @override
  void onEvent(LoanStatusEvent event) {
    super.onEvent(event);
    if (kDebugMode) {
      print("Event: $event");
    }
  }

  @override
  void onTransition(Transition<LoanStatusEvent, LoanStatusState> transition) {
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
