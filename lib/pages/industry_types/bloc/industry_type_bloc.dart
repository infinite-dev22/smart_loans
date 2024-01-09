import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:smart_loans/data_source/models/industry_type.dart';
import 'package:smart_loans/data_source/repositories/industry_type_repo.dart';

part 'industry_type_event.dart';
part 'industry_type_state.dart';

class IndustryTypeBloc extends Bloc<IndustryTypeEvent, IndustryTypeState> {
  IndustryTypeBloc() : super(const IndustryTypeState()) {
    on<GetIndustryTypes>(_mapGetIndustryTypesEventToState);
    on<GetIndustryType>(_mapGetIndustryTypeEventToState);
    on<CreateIndustryType>(_mapCreateIndustryTypeCreateIndustryEventToState);
    on<UpdateIndustryType>(_mapUpdateIndustryTypeEventToState);
    on<DeleteIndustryType>(_mapDeleteIndustryTypeEventToState);
    on<SelectIndustryType>(_mapSelectIndustryTypeEventToState);
  }

  Future<FutureOr<void>> _mapGetIndustryTypesEventToState(
      GetIndustryTypes event, Emitter<IndustryTypeState> emit) async {
    emit(state.copyWith(status: IndustryTypeStatus.loading));
    await IndustryTypeRepo.fetchAll().then((types) {
      emit(state.copyWith(status: IndustryTypeStatus.success, types: types));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: IndustryTypeStatus.error));
    });
  }

  Future<FutureOr<void>> _mapGetIndustryTypeEventToState(
      GetIndustryType event, Emitter<IndustryTypeState> emit) async {
    emit(state.copyWith(status: IndustryTypeStatus.loading));

    try {
      var type = await IndustryTypeRepo.fetch(event.idSelected);
      emit(state.copyWith(status: IndustryTypeStatus.success, type: type));
    } catch (e) {
      emit(state.copyWith(status: IndustryTypeStatus.error));
    }
  }

  Future<FutureOr<void>> _mapCreateIndustryTypeCreateIndustryEventToState(
      CreateIndustryType event, Emitter<IndustryTypeState> emit) async {
    emit(state.copyWith(status: IndustryTypeStatus.loading));
    try {
      var type = await IndustryTypeRepo.post(event.type);

      emit(state.copyWith(status: IndustryTypeStatus.success, type: type));
    } catch (e) {
      emit(state.copyWith(status: IndustryTypeStatus.error));
    }
  }

  Future<FutureOr<void>> _mapUpdateIndustryTypeEventToState(
      UpdateIndustryType event, Emitter<IndustryTypeState> emit) async {
    emit(state.copyWith(status: IndustryTypeStatus.loading));
    try {
      var type = await IndustryTypeRepo.put(event.type, event.idSelected);

      emit(state.copyWith(status: IndustryTypeStatus.success, type: type));
    } catch (e) {
      emit(state.copyWith(status: IndustryTypeStatus.error));
    }
  }

  FutureOr<void> _mapDeleteIndustryTypeEventToState(
      DeleteIndustryType event, Emitter<IndustryTypeState> emit) {
    emit(state.copyWith(status: IndustryTypeStatus.loading));
    try {
      emit(state.copyWith(status: IndustryTypeStatus.success));
    } catch (e) {
      emit(state.copyWith(status: IndustryTypeStatus.error));
    }
  }

  FutureOr<void> _mapSelectIndustryTypeEventToState(
      SelectIndustryType event, Emitter<IndustryTypeState> emit) {
    emit(state.copyWith(status: IndustryTypeStatus.loading));
    try {
      emit(
          state.copyWith(status: IndustryTypeStatus.success, idSelected: null));
    } catch (e) {
      emit(state.copyWith(status: IndustryTypeStatus.error));
    }
  }

  @override
  void onChange(Change<IndustryTypeState> change) {
    super.onChange(change);
    if (kDebugMode) {
      print("Change: $change");
    }
  }

  @override
  void onEvent(IndustryTypeEvent event) {
    super.onEvent(event);
    if (kDebugMode) {
      print("Event: $event");
    }
  }

  @override
  void onTransition(
      Transition<IndustryTypeEvent, IndustryTypeState> transition) {
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
