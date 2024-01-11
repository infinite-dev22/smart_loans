import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:smart_loans/data_source/models/interest_model.dart';
import 'package:smart_loans/data_source/models/loan_model.dart';
import 'package:smart_loans/data_source/repositories/interest_repo.dart';
import 'package:smart_loans/data_source/repositories/loan_repo.dart';

part 'loan_event.dart';
part 'loan_state.dart';

class LoanBloc extends Bloc<LoanEvent, LoanState> {
  LoanBloc() : super(const LoanState()) {
    on<GetLoans>(_mapGetLoansEventToState);
    on<GetLoan>(_mapGetLoanEventToState);
    on<CreateLoan>(_mapCreateLoanEventToState);
    on<UpdateLoan>(_mapUpdateLoanEventToState);
    on<DeleteLoan>(_mapDeleteLoanEventToState);
    on<SelectLoan>(_mapSelectLoanEventToState);
  }

  _mapGetLoansEventToState(GetLoans event, Emitter<LoanState> emit) async {
    emit(state.copyWith(status: LoanStatus.loading));
    await LoanRepo.fetchAll().then((loans) {
      emit(state.copyWith(status: LoanStatus.success, loans: loans));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: LoanStatus.error));
    });
  }

  _mapGetLoanEventToState(GetLoan event, Emitter<LoanState> emit) async {
    emit(state.copyWith(status: LoanStatus.loading));
    try {
      var loan = await LoanRepo.fetch(event.idSelected);
      emit(state.copyWith(status: LoanStatus.success, loan: loan));
    } catch (e) {
      emit(state.copyWith(status: LoanStatus.error));
    }
  }

  _mapCreateLoanEventToState(CreateLoan event, Emitter<LoanState> emit) async {
    emit(state.copyWith(status: LoanStatus.loading));
    await LoanRepo.post(event.loan).then((loan) {
      emit(state.copyWith(status: LoanStatus.success, loan: loan));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: LoanStatus.error));
    });
  }

  _mapUpdateLoanEventToState(UpdateLoan event, Emitter<LoanState> emit) async {
    emit(state.copyWith(status: LoanStatus.loading));
    try {
      var loan = await LoanRepo.put(event.loan, event.idSelected);
      emit(state.copyWith(status: LoanStatus.success, loan: loan));
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

  @override
  void onChange(Change<LoanState> change) {
    super.onChange(change);
    if (kDebugMode) {
      print("Change: $change");
    }
  }

  @override
  void onEvent(LoanEvent event) {
    super.onEvent(event);
    if (kDebugMode) {
      print("Event: $event");
    }
  }

  @override
  void onTransition(Transition<LoanEvent, LoanState> transition) {
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
