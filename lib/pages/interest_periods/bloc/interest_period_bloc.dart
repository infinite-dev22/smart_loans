import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:smart_loans/data_source/models/interest_period_model.dart';
import 'package:smart_loans/data_source/repositories/interest_period_repo.dart';

part 'interest_period_event.dart';
part 'interest_period_state.dart';

class InterestPeriodBloc
    extends Bloc<InterestPeriodEvent, InterestPeriodState> {
  InterestPeriodBloc() : super(const InterestPeriodState()) {
    on<GetInterestPeriods>(_mapGetInterestPeriodsEventToState);
    on<GetInterestPeriod>(_mapGetInterestPeriodEventToState);
    on<PostInterestPeriod>(_mapPostInterestPeriodEventToState);
    on<PutInterestPeriod>(_mapPutInterestPeriodEventToState);
    on<DeleteInterestPeriod>(_mapDeleteInterestPeriodEventToState);
    on<DeleteMultipleInterestPeriod>(
        _mapDeleteMultipleInterestPeriodEventToState);
    on<SetFixedRate>(_mapSetFixedRateEventToState);
    on<SetPercentage>(_mapSetPercentageEventToState);
  }

  _mapGetInterestPeriodsEventToState(
      GetInterestPeriods event, Emitter<InterestPeriodState> emit) async {
    emit(state.copyWith(status: InterestPeriodStatus.loading));
    await InterestPeriodRepo.fetchAll().then((interestPeriods) {
      emit(state.copyWith(
          status: InterestPeriodStatus.success,
          interestPeriods: interestPeriods));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: InterestPeriodStatus.error));
    });
  }

  _mapGetInterestPeriodEventToState(
      GetInterestPeriod event, Emitter<InterestPeriodState> emit) async {
    emit(state.copyWith(status: InterestPeriodStatus.loading));
    await InterestPeriodRepo.fetch(event.idSelected).then((interestPeriod) {
      emit(state.copyWith(
          status: InterestPeriodStatus.success,
          interestPeriod: interestPeriod));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: InterestPeriodStatus.error));
    });
  }

  _mapPostInterestPeriodEventToState(
      PostInterestPeriod event, Emitter<InterestPeriodState> emit) async {
    emit(state.copyWith(status: InterestPeriodStatus.loading));
    await InterestPeriodRepo.post(event.interestPeriod).then((interestPeriod) {
      emit(state.copyWith(
          status: InterestPeriodStatus.success,
          interestPeriod: interestPeriod));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: InterestPeriodStatus.error));
    });
  }

  _mapPutInterestPeriodEventToState(
      PutInterestPeriod event, Emitter<InterestPeriodState> emit) async {
    emit(state.copyWith(status: InterestPeriodStatus.loading));
    await InterestPeriodRepo.put(event.interestPeriod, event.idSelected)
        .then((interestPeriod) {
      emit(state.copyWith(
          status: InterestPeriodStatus.success,
          interestPeriod: interestPeriod));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: InterestPeriodStatus.error));
    });
  }

  _mapDeleteInterestPeriodEventToState(
      DeleteInterestPeriod event, Emitter<InterestPeriodState> emit) async {
    emit(state.copyWith(status: InterestPeriodStatus.loading));
    await InterestPeriodRepo.delete(event.idSelected).then((interestPeriod) {
      emit(state.copyWith(status: InterestPeriodStatus.success));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: InterestPeriodStatus.error));
    });
  }

  _mapDeleteMultipleInterestPeriodEventToState(
      DeleteMultipleInterestPeriod event,
      Emitter<InterestPeriodState> emit) async {
    emit(state.copyWith(status: InterestPeriodStatus.loading));
    await InterestPeriodRepo.deleteMultiple(event.idsSelected).then((interestPeriod) {
      emit(state.copyWith(status: InterestPeriodStatus.success));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: InterestPeriodStatus.error));
    });
  }

  _mapSetFixedRateEventToState(
      SetFixedRate event, Emitter<InterestPeriodState> emit) async {
    emit(state.copyWith(status: InterestPeriodStatus.fixedRate));
  }

  _mapSetPercentageEventToState(
      SetPercentage event, Emitter<InterestPeriodState> emit) async {
    emit(state.copyWith(status: InterestPeriodStatus.percentage));
  }

  @override
  void onChange(Change<InterestPeriodState> change) {
    super.onChange(change);
    if (kDebugMode) {
      print("Change: $change");
    }
  }

  @override
  void onEvent(InterestPeriodEvent event) {
    super.onEvent(event);
    if (kDebugMode) {
      print("Event: $event");
    }
  }

  @override
  void onTransition(
      Transition<InterestPeriodEvent, InterestPeriodState> transition) {
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
