import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:smart_loans/data_source/models/loan_duration_model.dart';
import 'package:smart_loans/data_source/repositories/loan_duration_repo.dart';

part 'loan_duration_event.dart';
part 'loan_duration_state.dart';

class LoanDurationBloc extends Bloc<LoanDurationEvent, LoanDurationState> {
  LoanDurationBloc() : super(const LoanDurationState()) {
    on<GetLoanDurations>(_mapGetLoanDurationsEventToState);
    on<GetLoanDuration>(_mapGetLoanDurationEventToState);
    on<PostLoanDuration>(_mapPostLoanDurationEventToState);
    on<PutLoanDuration>(_mapPutLoanDurationEventToState);
    on<DeleteLoanDuration>(_mapDeleteLoanDurationEventToState);
    on<DeleteMultipleLoanDuration>(_mapDeleteMultipleLoanDurationEventToState);
  }

  _mapGetLoanDurationsEventToState(
      GetLoanDurations event, Emitter<LoanDurationState> emit) async {
    emit(state.copyWith(status: LoanDurationStatus.loading));
    await LoanDurationRepo.fetchAll().then((loanDurations) {
      emit(state.copyWith(
          status: LoanDurationStatus.success, loanDurations: loanDurations));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: LoanDurationStatus.error));
    });
  }

  _mapGetLoanDurationEventToState(
      GetLoanDuration event, Emitter<LoanDurationState> emit) async {
    emit(state.copyWith(status: LoanDurationStatus.loading));
    await LoanDurationRepo.fetch(event.idSelected).then((loanDuration) {
      emit(state.copyWith(
          status: LoanDurationStatus.success, loanDuration: loanDuration));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: LoanDurationStatus.error));
    });
  }

  _mapPostLoanDurationEventToState(
      PostLoanDuration event, Emitter<LoanDurationState> emit) async {
    emit(state.copyWith(status: LoanDurationStatus.loading));
    await LoanDurationRepo.post(event.loanDuration).then((loanDuration) {
      emit(state.copyWith(
          status: LoanDurationStatus.success, loanDuration: loanDuration));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: LoanDurationStatus.error));
    });
  }

  _mapPutLoanDurationEventToState(
      PutLoanDuration event, Emitter<LoanDurationState> emit) async {
    emit(state.copyWith(status: LoanDurationStatus.loading));
    await LoanDurationRepo.put(event.loanDuration, event.idSelected)
        .then((loanDuration) {
      emit(state.copyWith(
          status: LoanDurationStatus.success, loanDuration: loanDuration));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: LoanDurationStatus.error));
    });
  }

  _mapDeleteLoanDurationEventToState(
      DeleteLoanDuration event, Emitter<LoanDurationState> emit) async {
    emit(state.copyWith(status: LoanDurationStatus.loading));
    await LoanDurationRepo.delete(event.idSelected).then((loanDuration) {
      emit(state.copyWith(status: LoanDurationStatus.success));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: LoanDurationStatus.error));
    });
  }

  _mapDeleteMultipleLoanDurationEventToState(
      DeleteMultipleLoanDuration event, Emitter<LoanDurationState> emit) async {
    emit(state.copyWith(status: LoanDurationStatus.loading));
    await LoanDurationRepo.deleteMultiple(event.idsSelected).then((loanDuration) {
      emit(state.copyWith(status: LoanDurationStatus.success));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: LoanDurationStatus.error));
    });
  }

  @override
  void onChange(Change<LoanDurationState> change) {
    super.onChange(change);
    if (kDebugMode) {
      print("Change: $change");
    }
  }

  @override
  void onEvent(LoanDurationEvent event) {
    super.onEvent(event);
    if (kDebugMode) {
      print("Event: $event");
    }
  }

  @override
  void onTransition(
      Transition<LoanDurationEvent, LoanDurationState> transition) {
    super.onTransition(transition);
    if (kDebugMode) {
      print("Event: $transition");
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
