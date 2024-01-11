import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:smart_loans/data_source/models/interest_model.dart';
import 'package:smart_loans/data_source/repositories/interest_repo.dart';

part 'interest_form_event.dart';
part 'interest_form_state.dart';

class InterestFormBloc extends Bloc<InterestFormEvent, InterestFormState> {
  InterestFormBloc() : super(const InterestFormState()) {
    on<GetInterest>(_mapLoadInterestFormEventToState);
    on<PostInterest>(_mapPostInterestFormEventToState);
    on<PutInterest>(_mapPutInterestFormEventToState);
    on<ShowFixedRate>(_mapSetFixedRateEventToState);
    on<ShowPercentage>(_mapSetPercentageEventToState);
  }

  _mapLoadInterestFormEventToState(
      GetInterest event, Emitter<InterestFormState> emit) async {
    emit(state.copyWith(status: InterestFormStatus.loading));
    await InterestRepo.fetchAll(event.idSelected).then((interests) {
      emit(state.copyWith(
          status: InterestFormStatus.success, interests: interests));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: InterestFormStatus.error));
    });
  }

  _mapPostInterestFormEventToState(
      PostInterest event, Emitter<InterestFormState> emit) async {
    emit(state.copyWith(status: InterestFormStatus.loading));
    await InterestRepo.post(event.interest, event.idSelected).then((interest) {
      emit(state.copyWith(
          status: InterestFormStatus.success, interest: interest));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: InterestFormStatus.error));
    });
  }

  _mapPutInterestFormEventToState(
      PutInterest event, Emitter<InterestFormState> emit) async {
    emit(state.copyWith(status: InterestFormStatus.loading));
    await InterestRepo.put(event.interest, event.idSelected).then((interest) {
      emit(state.copyWith(
          status: InterestFormStatus.success, interest: interest));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: InterestFormStatus.error));
    });
  }

  _mapSetFixedRateEventToState(
      ShowFixedRate event, Emitter<InterestFormState> emit) async {
    emit(state.copyWith(status: InterestFormStatus.fixedRate));
  }

  _mapSetPercentageEventToState(
      ShowPercentage event, Emitter<InterestFormState> emit) async {
    emit(state.copyWith(status: InterestFormStatus.percentage));
  }

  @override
  void onChange(Change<InterestFormState> change) {
    super.onChange(change);
    if (kDebugMode) {
      print("Change: $change");
    }
  }

  @override
  void onEvent(InterestFormEvent event) {
    super.onEvent(event);
    if (kDebugMode) {
      print("Event: $event");
    }
  }

  @override
  void onTransition(
      Transition<InterestFormEvent, InterestFormState> transition) {
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
