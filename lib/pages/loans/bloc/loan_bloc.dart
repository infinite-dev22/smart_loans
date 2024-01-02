import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:smart_loans/data_source/models/loan_model.dart';

part 'loan_event.dart';
part 'loan_state.dart';

class LoanBloc extends Bloc<LoanEvent, LoanState> {
  LoanBloc() : super(LoanInitial()) {
    on<GetLoans>(_mapGetLoansEventToState);
    on<GetLoan>(_mapGetLoanEventToState);
    on<CreateLoan>(_mapCreateLoanEventToState);
    on<UpdateLoan>(_mapUpdateLoanEventToState);
    on<DeleteLoan>(_mapDeleteLoanEventToState);
    on<SelectLoan>(_mapSelectLoanEventToState);
  }

  _mapGetLoansEventToState(GetLoans event, Emitter<LoanState> emit) {
    emit(state.copyWith(status: LoanStatus.loading));
    try {
      emit(state.copyWith(status: LoanStatus.success, loans: null));
    } catch (e) {
      emit(state.copyWith(status: LoanStatus.error));
    }
  }

  _mapGetLoanEventToState(GetLoan event, Emitter<LoanState> emit) {
    emit(state.copyWith(status: LoanStatus.loading));
    try {
      emit(state.copyWith(status: LoanStatus.success, loan: null));
    } catch (e) {
      emit(state.copyWith(status: LoanStatus.error));
    }
  }

  _mapCreateLoanEventToState(CreateLoan event, Emitter<LoanState> emit) {
    emit(state.copyWith(status: LoanStatus.loading));
    try {
      emit(state.copyWith(status: LoanStatus.success, loan: null));
    } catch (e) {
      emit(state.copyWith(status: LoanStatus.error));
    }
  }

  _mapUpdateLoanEventToState(UpdateLoan event, Emitter<LoanState> emit) {
    emit(state.copyWith(status: LoanStatus.loading));
    try {
      emit(state.copyWith(status: LoanStatus.success, loan: null));
    } catch (e) {
      emit(state.copyWith(status: LoanStatus.error));
    }
  }

  _mapDeleteLoanEventToState(DeleteLoan event, Emitter<LoanState> emit) {
    emit(state.copyWith(status: LoanStatus.loading));
    try {
      emit(state.copyWith(status: LoanStatus.success));
    } catch (e) {
      emit(state.copyWith(status: LoanStatus.error));
    }
  }

  _mapSelectLoanEventToState(SelectLoan event, Emitter<LoanState> emit) {
    emit(state.copyWith(status: LoanStatus.loading));
    try {
      emit(state.copyWith(status: LoanStatus.success, idSelected: null));
    } catch (e) {
      emit(state.copyWith(status: LoanStatus.error));
    }
  }
}
