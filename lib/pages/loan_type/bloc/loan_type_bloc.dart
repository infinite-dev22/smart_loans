import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:smart_loans/data_source/models/loan_type_model.dart';
import 'package:smart_loans/data_source/repositories/loan_type_repo.dart';

part 'loan_type_event.dart';
part 'loan_type_state.dart';

class LoanTypeBloc extends Bloc<LoanTypeEvent, LoanTypeState> {
  LoanTypeBloc() : super(const LoanTypeState()) {
    on<GetLoanTypes>(_mapGetLoanTypesEventToState);
    on<GetLoanType>(_mapGetLoanTypeEventToState);
    on<CreateLoanType>(_mapCreateLoanTypeCreateClientEventToState);
    on<UpdateLoanType>(_mapUpdateLoanTypeEventToState);
    on<DeleteLoanType>(_mapDeleteLoanTypeEventToState);
    on<SelectLoanType>(_mapSelectLoanTypeEventToState);
  }

  Future<FutureOr<void>> _mapGetLoanTypesEventToState(
      GetLoanTypes event, Emitter<LoanTypeState> emit) async {
    emit(state.copyWith(status: LoanTypeStatus.loading));
    await LoanTypeRepo.fetchAll().then((loanTypes) {
      emit(
          state.copyWith(status: LoanTypeStatus.success, loanTypes: loanTypes));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: LoanTypeStatus.error));
    });
  }

  Future<FutureOr<void>> _mapGetLoanTypeEventToState(
      GetLoanType event, Emitter<LoanTypeState> emit) async {
    emit(state.copyWith(status: LoanTypeStatus.loading));

    try {
      var loanType = await LoanTypeRepo.fetch(event.idSelected);
      emit(state.copyWith(status: LoanTypeStatus.success, loanType: loanType));
    } catch (e) {
      emit(state.copyWith(status: LoanTypeStatus.error));
    }
  }

  Future<FutureOr<void>> _mapCreateLoanTypeCreateClientEventToState(
      CreateLoanType event, Emitter<LoanTypeState> emit) async {
    emit(state.copyWith(status: LoanTypeStatus.loading));
    try {
      var loanType = await LoanTypeRepo.post(event.loanType);

      emit(state.copyWith(status: LoanTypeStatus.success, loanType: loanType));
    } catch (e) {
      emit(state.copyWith(status: LoanTypeStatus.error));
    }
  }

  Future<FutureOr<void>> _mapUpdateLoanTypeEventToState(
      UpdateLoanType event, Emitter<LoanTypeState> emit) async {
    emit(state.copyWith(status: LoanTypeStatus.loading));
    try {
      var loanType = await LoanTypeRepo.put(event.loanType, event.idSelected);

      emit(state.copyWith(status: LoanTypeStatus.success, loanType: loanType));
    } catch (e) {
      emit(state.copyWith(status: LoanTypeStatus.error));
    }
  }

  FutureOr<void> _mapDeleteLoanTypeEventToState(
      DeleteLoanType event, Emitter<LoanTypeState> emit) {
    emit(state.copyWith(status: LoanTypeStatus.loading));
    try {
      emit(state.copyWith(status: LoanTypeStatus.success));
    } catch (e) {
      emit(state.copyWith(status: LoanTypeStatus.error));
    }
  }

  FutureOr<void> _mapSelectLoanTypeEventToState(
      SelectLoanType event, Emitter<LoanTypeState> emit) {
    emit(state.copyWith(status: LoanTypeStatus.loading));
    try {
      emit(state.copyWith(status: LoanTypeStatus.success, idSelected: null));
    } catch (e) {
      emit(state.copyWith(status: LoanTypeStatus.error));
    }
  }

  @override
  void onChange(Change<LoanTypeState> change) {
    super.onChange(change);
    if (kDebugMode) {
      print("Change: $change");
    }
  }

  @override
  void onEvent(LoanTypeEvent event) {
    super.onEvent(event);
    if (kDebugMode) {
      print("Event: $event");
    }
  }

  @override
  void onTransition(Transition<LoanTypeEvent, LoanTypeState> transition) {
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
