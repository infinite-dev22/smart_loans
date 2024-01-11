import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:smart_loans/data_source/models/loan_category_model.dart';
import 'package:smart_loans/data_source/repositories/loan_category_repo.dart';

part 'loan_category_event.dart';
part 'loan_category_state.dart';

class LoanCategoryBloc extends Bloc<LoanCategoryEvent, LoanCategoryState> {
  LoanCategoryBloc() : super(const LoanCategoryState()) {
    on<GetLoanCategories>(_mapGetCurrenciesEventToState);
    on<GetLoanCategory>(_mapGetLoanCategoryEventToState);
    on<CreateLoanCategory>(_mapCreateLoanCategoryCreateClientEventToState);
    on<UpdateLoanCategory>(_mapUpdateLoanCategoryEventToState);
    on<DeleteLoanCategory>(_mapDeleteLoanCategoryEventToState);
    on<SelectLoanCategory>(_mapSelectLoanCategoryEventToState);
  }

  Future<FutureOr<void>> _mapGetCurrenciesEventToState(
      GetLoanCategories event, Emitter<LoanCategoryState> emit) async {
    emit(state.copyWith(status: LoanCategoryStatus.loading));
    await LoanCategoryRepo.fetchAll().then((loanCategories) {
      emit(state.copyWith(
          status: LoanCategoryStatus.success, loanCategories: loanCategories));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: LoanCategoryStatus.error));
    });
  }

  Future<FutureOr<void>> _mapGetLoanCategoryEventToState(
      GetLoanCategory event, Emitter<LoanCategoryState> emit) async {
    emit(state.copyWith(status: LoanCategoryStatus.loading));

    try {
      var loanCategory = await LoanCategoryRepo.fetch(event.idSelected);
      emit(state.copyWith(
          status: LoanCategoryStatus.success, loanCategory: loanCategory));
    } catch (e) {
      emit(state.copyWith(status: LoanCategoryStatus.error));
    }
  }

  Future<FutureOr<void>> _mapCreateLoanCategoryCreateClientEventToState(
      CreateLoanCategory event, Emitter<LoanCategoryState> emit) async {
    emit(state.copyWith(status: LoanCategoryStatus.loading));
    try {
      var loanCategory = await LoanCategoryRepo.post(event.loanCategory);

      emit(state.copyWith(
          status: LoanCategoryStatus.success, loanCategory: loanCategory));
    } catch (e) {
      emit(state.copyWith(status: LoanCategoryStatus.error));
    }
  }

  Future<FutureOr<void>> _mapUpdateLoanCategoryEventToState(
      UpdateLoanCategory event, Emitter<LoanCategoryState> emit) async {
    emit(state.copyWith(status: LoanCategoryStatus.loading));
    try {
      var loanCategory =
          await LoanCategoryRepo.put(event.loanCategory, event.idSelected);

      emit(state.copyWith(
          status: LoanCategoryStatus.success, loanCategory: loanCategory));
    } catch (e) {
      emit(state.copyWith(status: LoanCategoryStatus.error));
    }
  }

  FutureOr<void> _mapDeleteLoanCategoryEventToState(
      DeleteLoanCategory event, Emitter<LoanCategoryState> emit) {
    emit(state.copyWith(status: LoanCategoryStatus.loading));
    try {
      emit(state.copyWith(status: LoanCategoryStatus.success));
    } catch (e) {
      emit(state.copyWith(status: LoanCategoryStatus.error));
    }
  }

  FutureOr<void> _mapSelectLoanCategoryEventToState(
      SelectLoanCategory event, Emitter<LoanCategoryState> emit) {
    emit(state.copyWith(status: LoanCategoryStatus.loading));
    try {
      emit(
          state.copyWith(status: LoanCategoryStatus.success, idSelected: null));
    } catch (e) {
      emit(state.copyWith(status: LoanCategoryStatus.error));
    }
  }

  @override
  void onChange(Change<LoanCategoryState> change) {
    super.onChange(change);
    if (kDebugMode) {
      print("Change: $change");
    }
  }

  @override
  void onEvent(LoanCategoryEvent event) {
    super.onEvent(event);
    if (kDebugMode) {
      print("Event: $event");
    }
  }

  @override
  void onTransition(
      Transition<LoanCategoryEvent, LoanCategoryState> transition) {
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
