import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:smart_loans/data_source/models/loan_model.dart';

import '../../../data_source/models/loan_payment_model.dart';
import '../../../data_source/repositories/loan_payment_repo.dart';

part 'loan_payment_event.dart';
part 'loan_payment_state.dart';


class LoanPaymentBloc extends Bloc<LoanPaymentEvent, LoanPaymentState> {
  LoanPaymentBloc() : super( LoanPaymentState()) {
    on<GetLoanPayments>(_mapGetLoanPaymentsEventToState);
    on<GetLoanPayment>(_mapGetLoanPaymentEventToState);
    on<CreateLoanPayment>(_mapCreateLoanPaymentCreateClientEventToState);
    on<UpdateLoanPayment>(_mapUpdateLoanPaymentEventToState);
    on<DeleteLoanPayment>(_mapDeleteLoanPaymentEventToState);
    on<SelectLoanPayment>(_mapSelectLoanPaymentEventToState);
  }

  Future<FutureOr<void>> _mapGetLoanPaymentsEventToState(
      GetLoanPayments event, Emitter<LoanPaymentState> emit) async {
    emit(state.copyWith(status: LoanPaymentStatus.loading));
    await LoanPaymentRepo.fetchAll(event.loanId).then((loanPayments) {
      emit(state.copyWith(
          status: LoanPaymentStatus.success, loanPayments: loanPayments));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: LoanPaymentStatus.error));
    });
  }

  Future<FutureOr<void>> _mapGetLoanPaymentEventToState(
      GetLoanPayment event, Emitter<LoanPaymentState> emit) async {
    emit(state.copyWith(status: LoanPaymentStatus.loading));

    try {
      var loanPayment = await LoanPaymentRepo.fetch(event.idSelected);
      emit(state.copyWith(
          status: LoanPaymentStatus.success, loanPayment: loanPayment));
    } catch (e) {
      emit(state.copyWith(status: LoanPaymentStatus.error));
    }
  }

  Future<FutureOr<void>> _mapCreateLoanPaymentCreateClientEventToState(
      CreateLoanPayment event, Emitter<LoanPaymentState> emit) async {
    emit(state.copyWith(status: LoanPaymentStatus.loading));
    try {
      var loanPayment = await LoanPaymentRepo.post(event.loanPayment);

      emit(state.copyWith(
          status: LoanPaymentStatus.success, loanPayment: loanPayment));
    } catch (e) {
      emit(state.copyWith(status: LoanPaymentStatus.error));
    }
  }

  Future<FutureOr<void>> _mapUpdateLoanPaymentEventToState(
      UpdateLoanPayment event, Emitter<LoanPaymentState> emit) async {
    emit(state.copyWith(status: LoanPaymentStatus.loading));
    try {
      var loanPayment =
      await LoanPaymentRepo.put(event.loanPayment, event.idSelected);

      emit(state.copyWith(
          status: LoanPaymentStatus.success, loanPayment: loanPayment));
    } catch (e) {
      emit(state.copyWith(status: LoanPaymentStatus.error));
    }
  }

  FutureOr<void> _mapDeleteLoanPaymentEventToState(
      DeleteLoanPayment event, Emitter<LoanPaymentState> emit) {
    emit(state.copyWith(status: LoanPaymentStatus.loading));
    try {
      emit(state.copyWith(status: LoanPaymentStatus.success));
    } catch (e) {
      emit(state.copyWith(status: LoanPaymentStatus.error));
    }
  }

  FutureOr<void> _mapSelectLoanPaymentEventToState(
      SelectLoanPayment event, Emitter<LoanPaymentState> emit) {
    emit(state.copyWith(status: LoanPaymentStatus.loading));
    try {
      emit(
          state.copyWith(status: LoanPaymentStatus.success, idSelected: null));
    } catch (e) {
      emit(state.copyWith(status: LoanPaymentStatus.error));
    }
  }

  @override
  void onChange(Change<LoanPaymentState> change) {
    super.onChange(change);
    if (kDebugMode) {
      print("Change: $change");
    }
  }

  @override
  void onEvent(LoanPaymentEvent event) {
    super.onEvent(event);
    if (kDebugMode) {
      print("Event: $event");
    }
  }

  @override
  void onTransition(
      Transition<LoanPaymentEvent, LoanPaymentState> transition) {
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
