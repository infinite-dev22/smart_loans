import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:smart_loans/data_source/models/interest_method_model.dart';
import 'package:smart_loans/data_source/repositories/interest_method_repo.dart';

part 'interest_method_event.dart';
part 'interest_method_state.dart';

class InterestMethodBloc
    extends Bloc<InterestMethodEvent, InterestMethodState> {
  InterestMethodBloc() : super(const InterestMethodState()) {
    on<GetInterestMethods>(_mapLoadInterestMethodsEventToState);
    on<GetInterestMethod>(_mapLoadInterestMethodEventToState);
    on<PostInterestMethod>(_mapPostInterestMethodEventToState);
    on<PutInterestMethod>(_mapPutInterestMethodEventToState);
    on<SetFixedRate>(_mapSetFixedRateEventToState);
    on<SetPercentage>(_mapSetPercentageEventToState);
  }

  _mapLoadInterestMethodsEventToState(
      GetInterestMethods event, Emitter<InterestMethodState> emit) async {
    emit(state.copyWith(status: InterestMethodStatus.loading));
    await InterestMethodRepo.fetchAll().then((interestMethods) {
      emit(state.copyWith(
          status: InterestMethodStatus.success,
          interestMethods: interestMethods));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: InterestMethodStatus.error));
    });
  }

  _mapLoadInterestMethodEventToState(
      GetInterestMethod event, Emitter<InterestMethodState> emit) async {
    emit(state.copyWith(status: InterestMethodStatus.loading));
    await InterestMethodRepo.fetch(event.idSelected).then((interestMethod) {
      emit(state.copyWith(
          status: InterestMethodStatus.success,
          interestMethod: interestMethod));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: InterestMethodStatus.error));
    });
  }

  _mapPostInterestMethodEventToState(
      PostInterestMethod event, Emitter<InterestMethodState> emit) async {
    emit(state.copyWith(status: InterestMethodStatus.loading));
    await InterestMethodRepo.post(event.interestMethod).then((interestMethod) {
      emit(state.copyWith(
          status: InterestMethodStatus.success,
          interestMethod: interestMethod));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: InterestMethodStatus.error));
    });
  }

  _mapPutInterestMethodEventToState(
      PutInterestMethod event, Emitter<InterestMethodState> emit) async {
    emit(state.copyWith(status: InterestMethodStatus.loading));
    await InterestMethodRepo.put(event.interestMethod, event.idSelected)
        .then((interestMethod) {
      emit(state.copyWith(
          status: InterestMethodStatus.success,
          interestMethod: interestMethod));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: InterestMethodStatus.error));
    });
  }

  _mapSetFixedRateEventToState(
      SetFixedRate event, Emitter<InterestMethodState> emit) async {
    emit(state.copyWith(status: InterestMethodStatus.fixedRate));
  }

  _mapSetPercentageEventToState(
      SetPercentage event, Emitter<InterestMethodState> emit) async {
    emit(state.copyWith(status: InterestMethodStatus.percentage));
  }

  @override
  void onChange(Change<InterestMethodState> change) {
    super.onChange(change);
    if (kDebugMode) {
      print("Change: $change");
    }
  }

  @override
  void onEvent(InterestMethodEvent event) {
    super.onEvent(event);
    if (kDebugMode) {
      print("Event: $event");
    }
  }

  @override
  void onTransition(
      Transition<InterestMethodEvent, InterestMethodState> transition) {
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
