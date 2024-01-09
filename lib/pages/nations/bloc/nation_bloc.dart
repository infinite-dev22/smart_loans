import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:smart_loans/data_source/models/nation_model.dart';
import 'package:smart_loans/data_source/repositories/nation_repo.dart';

part 'nation_event.dart';
part 'nation_state.dart';

class NationBloc extends Bloc<NationEvent, NationState> {
  NationBloc() : super(const NationState()) {
    on<GetNations>(_mapGetNationsEventToState);
    on<GetNation>(_mapGetNationEventToState);
    on<CreateNation>(_mapCreateNationCreateClientEventToState);
    on<UpdateNation>(_mapUpdateNationEventToState);
    on<DeleteNation>(_mapDeleteNationEventToState);
    on<SelectNation>(_mapSelectNationEventToState);
  }

  Future<FutureOr<void>> _mapGetNationsEventToState(
      GetNations event, Emitter<NationState> emit) async {
    emit(state.copyWith(status: NationStatus.loading));
    await NationRepo.fetchAll().then((nations) {
      emit(state.copyWith(status: NationStatus.success, nations: nations));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: NationStatus.error));
    });
  }

  Future<FutureOr<void>> _mapGetNationEventToState(
      GetNation event, Emitter<NationState> emit) async {
    emit(state.copyWith(status: NationStatus.loading));

    try {
      var nation = await NationRepo.fetch(event.idSelected);
      emit(state.copyWith(status: NationStatus.success, nation: nation));
    } catch (e) {
      emit(state.copyWith(status: NationStatus.error));
    }
  }

  Future<FutureOr<void>> _mapCreateNationCreateClientEventToState(
      CreateNation event, Emitter<NationState> emit) async {
    emit(state.copyWith(status: NationStatus.loading));
    try {
      var nation = await NationRepo.post(event.nation);

      emit(state.copyWith(status: NationStatus.success, nation: nation));
    } catch (e) {
      emit(state.copyWith(status: NationStatus.error));
    }
  }

  Future<FutureOr<void>> _mapUpdateNationEventToState(
      UpdateNation event, Emitter<NationState> emit) async {
    emit(state.copyWith(status: NationStatus.loading));
    try {
      var nation = await NationRepo.put(event.nation, event.idSelected);

      emit(state.copyWith(status: NationStatus.success, nation: nation));
    } catch (e) {
      emit(state.copyWith(status: NationStatus.error));
    }
  }

  FutureOr<void> _mapDeleteNationEventToState(
      DeleteNation event, Emitter<NationState> emit) {
    emit(state.copyWith(status: NationStatus.loading));
    try {
      emit(state.copyWith(status: NationStatus.success));
    } catch (e) {
      emit(state.copyWith(status: NationStatus.error));
    }
  }

  FutureOr<void> _mapSelectNationEventToState(
      SelectNation event, Emitter<NationState> emit) {
    emit(state.copyWith(status: NationStatus.loading));
    try {
      emit(state.copyWith(status: NationStatus.success, idSelected: null));
    } catch (e) {
      emit(state.copyWith(status: NationStatus.error));
    }
  }

  @override
  void onChange(Change<NationState> change) {
    super.onChange(change);
    if (kDebugMode) {
      print("Change: $change");
    }
  }

  @override
  void onEvent(NationEvent event) {
    super.onEvent(event);
    if (kDebugMode) {
      print("Event: $event");
    }
  }

  @override
  void onTransition(Transition<NationEvent, NationState> transition) {
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
