import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:smart_loans/data_source/models/loan_schedule_model.dart';
import 'package:smart_loans/data_source/repositories/loan_schedule_repo.dart';

part 'loan_schedule_event.dart';
part 'loan_schedule_state.dart';

class LoanScheduleBloc extends Bloc<LoanScheduleEvent, LoanScheduleState> {
  LoanScheduleBloc() : super(const LoanScheduleState()) {
    on<GetLoanSchedules>(_mapGetLoanSchedulesEventToState);
    on<GetLoanSchedule>(_mapGetLoanScheduleEventToState);
    on<CreateLoanSchedule>(_mapCreateLoanScheduleCreateClientEventToState);
    on<UpdateLoanSchedule>(_mapUpdateLoanScheduleEventToState);
    on<DeleteLoanSchedule>(_mapDeleteLoanScheduleEventToState);
    on<SelectLoanSchedule>(_mapSelectLoanScheduleEventToState);
  }

  Future<FutureOr<void>> _mapGetLoanSchedulesEventToState(
      GetLoanSchedules event, Emitter<LoanScheduleState> emit) async {
    emit(state.copyWith(status: LoanScheduleStatus.loading));
    await LoanScheduleRepo.fetchAll(event.loanId).then((loanSchedules) {
      emit(state.copyWith(
          status: LoanScheduleStatus.success, loanSchedules: loanSchedules));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: LoanScheduleStatus.error));
    });
  }

  Future<FutureOr<void>> _mapGetLoanScheduleEventToState(
      GetLoanSchedule event, Emitter<LoanScheduleState> emit) async {
    emit(state.copyWith(status: LoanScheduleStatus.loading));

    try {
      var loanSchedule = await LoanScheduleRepo.fetch(event.idSelected);
      emit(state.copyWith(
          status: LoanScheduleStatus.success, loanSchedule: loanSchedule));
    } catch (e) {
      emit(state.copyWith(status: LoanScheduleStatus.error));
    }
  }

  Future<FutureOr<void>> _mapCreateLoanScheduleCreateClientEventToState(
      CreateLoanSchedule event, Emitter<LoanScheduleState> emit) async {
    emit(state.copyWith(status: LoanScheduleStatus.loading));
    try {
      var loanSchedule = await LoanScheduleRepo.post(event.loanSchedule);

      emit(state.copyWith(
          status: LoanScheduleStatus.success, loanSchedule: loanSchedule));
    } catch (e) {
      emit(state.copyWith(status: LoanScheduleStatus.error));
    }
  }

  Future<FutureOr<void>> _mapUpdateLoanScheduleEventToState(
      UpdateLoanSchedule event, Emitter<LoanScheduleState> emit) async {
    emit(state.copyWith(status: LoanScheduleStatus.loading));
    try {
      var loanSchedule =
          await LoanScheduleRepo.put(event.loanSchedule, event.idSelected);

      emit(state.copyWith(
          status: LoanScheduleStatus.success, loanSchedule: loanSchedule));
    } catch (e) {
      emit(state.copyWith(status: LoanScheduleStatus.error));
    }
  }

  FutureOr<void> _mapDeleteLoanScheduleEventToState(
      DeleteLoanSchedule event, Emitter<LoanScheduleState> emit) {
    emit(state.copyWith(status: LoanScheduleStatus.loading));
    try {
      emit(state.copyWith(status: LoanScheduleStatus.success));
    } catch (e) {
      emit(state.copyWith(status: LoanScheduleStatus.error));
    }
  }

  FutureOr<void> _mapSelectLoanScheduleEventToState(
      SelectLoanSchedule event, Emitter<LoanScheduleState> emit) {
    emit(state.copyWith(status: LoanScheduleStatus.loading));
    try {
      emit(
          state.copyWith(status: LoanScheduleStatus.success, idSelected: null));
    } catch (e) {
      emit(state.copyWith(status: LoanScheduleStatus.error));
    }
  }

  @override
  void onChange(Change<LoanScheduleState> change) {
    super.onChange(change);
    if (kDebugMode) {
      print("Change: $change");
    }
  }

  @override
  void onEvent(LoanScheduleEvent event) {
    super.onEvent(event);
    if (kDebugMode) {
      print("Event: $event");
    }
  }

  @override
  void onTransition(
      Transition<LoanScheduleEvent, LoanScheduleState> transition) {
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
