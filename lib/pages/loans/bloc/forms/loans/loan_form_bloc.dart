import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:smart_loans/data_source/models/loan_model.dart';
import 'package:smart_loans/data_source/models/role_model.dart';
import 'package:smart_loans/data_source/repositories/loan_repo.dart';
import 'package:smart_loans/data_source/repositories/roles_repo.dart';

part 'loan_form_event.dart';
part 'loan_form_state.dart';

class LoanFormBloc extends Bloc<LoanFormEvent, LoanFormState> {
  LoanFormBloc() : super(const LoanFormState()) {
    on<GetLoan>(_mapLoadLoanFormEventToState);
    on<PostLoan>(_mapPostLoanFormEventToState);
    on<PutLoan>(_mapPutLoanFormEventToState);
    on<SetFixedRate>(_mapSetFixedRateEventToState);
    on<SetPercentage>(_mapSetPercentageEventToState);
  }

  _mapLoadLoanFormEventToState(
      GetLoan event, Emitter<LoanFormState> emit) async {
    emit(state.copyWith(status: LoanFormStatus.loading));
    await RoleRepo.fetchAll().then((roles) {
      emit(state.copyWith(status: LoanFormStatus.success, roles: roles));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: LoanFormStatus.error));
    });
  }

  _mapPostLoanFormEventToState(
      PostLoan event, Emitter<LoanFormState> emit) async {
    emit(state.copyWith(status: LoanFormStatus.loading));
    await LoanRepo.post(event.loan).then((loan) {
      emit(state.copyWith(status: LoanFormStatus.success, loan: loan));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: LoanFormStatus.error));
    });
  }

  _mapPutLoanFormEventToState(
      PutLoan event, Emitter<LoanFormState> emit) async {
    emit(state.copyWith(status: LoanFormStatus.loading));
    await LoanRepo.put(event.loan, event.idSelected).then((loan) {
      emit(state.copyWith(status: LoanFormStatus.success, loan: loan));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: LoanFormStatus.error));
    });
  }

  _mapSetFixedRateEventToState(
      SetFixedRate event, Emitter<LoanFormState> emit) async {
    emit(state.copyWith(status: LoanFormStatus.fixedRate));
  }

  _mapSetPercentageEventToState(
      SetPercentage event, Emitter<LoanFormState> emit) async {
    emit(state.copyWith(status: LoanFormStatus.percentage));
  }

  @override
  void onChange(Change<LoanFormState> change) {
    super.onChange(change);
    if (kDebugMode) {
      print("Change: $change");
    }
  }

  @override
  void onEvent(LoanFormEvent event) {
    super.onEvent(event);
    if (kDebugMode) {
      print("Event: $event");
    }
  }

  @override
  void onTransition(Transition<LoanFormEvent, LoanFormState> transition) {
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
