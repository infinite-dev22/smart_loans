import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:smart_loans/data_source/models/repayment_cycle_model.dart';
import 'package:smart_loans/data_source/repositories/repayment_cycle_repo.dart';

part 'repayment_cycle_event.dart';
part 'repayment_cycle_state.dart';

class RepaymentCycleBloc
    extends Bloc<RepaymentCycleEvent, RepaymentCycleState> {
  RepaymentCycleBloc() : super(const RepaymentCycleState()) {
    on<GetRepaymentCycles>(_mapGetRepaymentCyclesEventToState);
    on<GetRepaymentCycle>(_mapGetRepaymentCycleEventToState);
    on<PostRepaymentCycle>(_mapPostRepaymentCycleEventToState);
    on<PutRepaymentCycle>(_mapPutRepaymentCycleEventToState);
    on<DeleteRepaymentCycle>(_mapDeleteRepaymentCycleEventToState);
    on<DeleteMultipleRepaymentCycle>(
        _mapDeleteMultipleRepaymentCycleEventToState);
  }

  _mapGetRepaymentCyclesEventToState(
      GetRepaymentCycles event, Emitter<RepaymentCycleState> emit) async {
    emit(state.copyWith(status: RepaymentCycleStatus.loading));
    await RepaymentCycleRepo.fetchAll().then((repaymentCycles) {
      emit(state.copyWith(
          status: RepaymentCycleStatus.success,
          repaymentCycles: repaymentCycles));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: RepaymentCycleStatus.error));
    });
  }

  _mapGetRepaymentCycleEventToState(
      GetRepaymentCycle event, Emitter<RepaymentCycleState> emit) async {
    emit(state.copyWith(status: RepaymentCycleStatus.loading));
    await RepaymentCycleRepo.fetch(event.idSelected).then((repaymentCycle) {
      emit(state.copyWith(
          status: RepaymentCycleStatus.success,
          repaymentCycle: repaymentCycle));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: RepaymentCycleStatus.error));
    });
  }

  _mapPostRepaymentCycleEventToState(
      PostRepaymentCycle event, Emitter<RepaymentCycleState> emit) async {
    emit(state.copyWith(status: RepaymentCycleStatus.loading));
    await RepaymentCycleRepo.post(event.repaymentCycle).then((repaymentCycle) {
      emit(state.copyWith(
          status: RepaymentCycleStatus.success,
          repaymentCycle: repaymentCycle));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: RepaymentCycleStatus.error));
    });
  }

  _mapPutRepaymentCycleEventToState(
      PutRepaymentCycle event, Emitter<RepaymentCycleState> emit) async {
    emit(state.copyWith(status: RepaymentCycleStatus.loading));
    await RepaymentCycleRepo.put(event.repaymentCycle, event.idSelected)
        .then((repaymentCycle) {
      emit(state.copyWith(
          status: RepaymentCycleStatus.success,
          repaymentCycle: repaymentCycle));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: RepaymentCycleStatus.error));
    });
  }

  _mapDeleteRepaymentCycleEventToState(
      DeleteRepaymentCycle event, Emitter<RepaymentCycleState> emit) async {
    emit(state.copyWith(status: RepaymentCycleStatus.loading));
    await RepaymentCycleRepo.delete(event.idSelected).then((repaymentCycle) {
      emit(state.copyWith(status: RepaymentCycleStatus.success));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: RepaymentCycleStatus.error));
    });
  }

  _mapDeleteMultipleRepaymentCycleEventToState(
      DeleteMultipleRepaymentCycle event,
      Emitter<RepaymentCycleState> emit) async {
    emit(state.copyWith(status: RepaymentCycleStatus.loading));
    await RepaymentCycleRepo.deleteMultiple(event.idsSelected)
        .then((repaymentCycle) {
      emit(state.copyWith(status: RepaymentCycleStatus.success));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: RepaymentCycleStatus.error));
    });
  }

  @override
  void onChange(Change<RepaymentCycleState> change) {
    super.onChange(change);
    if (kDebugMode) {
      print("Change: $change");
    }
  }

  @override
  void onEvent(RepaymentCycleEvent event) {
    super.onEvent(event);
    if (kDebugMode) {
      print("Event: $event");
    }
  }

  @override
  void onTransition(
      Transition<RepaymentCycleEvent, RepaymentCycleState> transition) {
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
