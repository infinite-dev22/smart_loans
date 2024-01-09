import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:smart_loans/data_source/models/client_type_model.dart';
import 'package:smart_loans/data_source/repositories/client_type_repo.dart';

part 'client_type_event.dart';
part 'client_type_state.dart';

class ClientTypeBloc extends Bloc<ClientTypeEvent, ClientTypeState> {
  ClientTypeBloc() : super(const ClientTypeState()) {
    on<GetClientTypes>(_mapGetClientTypesEventToState);
    on<GetClientType>(_mapGetClientTypeEventToState);
    on<CreateClientType>(_mapCreateClientTypeCreateClientEventToState);
    on<UpdateClientType>(_mapUpdateClientTypeEventToState);
    on<DeleteClientType>(_mapDeleteClientTypeEventToState);
    on<SelectClientType>(_mapSelectClientTypeEventToState);
  }

  Future<FutureOr<void>> _mapGetClientTypesEventToState(
      GetClientTypes event, Emitter<ClientTypeState> emit) async {
    emit(state.copyWith(status: ClientTypeStatus.loading));
    await ClientTypeRepo.fetchAll().then((types) {
      emit(state.copyWith(status: ClientTypeStatus.success, types: types));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: ClientTypeStatus.error));
    });
  }

  Future<FutureOr<void>> _mapGetClientTypeEventToState(
      GetClientType event, Emitter<ClientTypeState> emit) async {
    emit(state.copyWith(status: ClientTypeStatus.loading));

    try {
      var type = await ClientTypeRepo.fetch(event.idSelected);
      emit(state.copyWith(status: ClientTypeStatus.success, type: type));
    } catch (e) {
      emit(state.copyWith(status: ClientTypeStatus.error));
    }
  }

  Future<FutureOr<void>> _mapCreateClientTypeCreateClientEventToState(
      CreateClientType event, Emitter<ClientTypeState> emit) async {
    emit(state.copyWith(status: ClientTypeStatus.loading));
    try {
      var type = await ClientTypeRepo.post(event.type);

      emit(state.copyWith(status: ClientTypeStatus.success, type: type));
    } catch (e) {
      emit(state.copyWith(status: ClientTypeStatus.error));
    }
  }

  Future<FutureOr<void>> _mapUpdateClientTypeEventToState(
      UpdateClientType event, Emitter<ClientTypeState> emit) async {
    emit(state.copyWith(status: ClientTypeStatus.loading));
    try {
      var type = await ClientTypeRepo.put(event.type, event.idSelected);

      emit(state.copyWith(status: ClientTypeStatus.success, type: type));
    } catch (e) {
      emit(state.copyWith(status: ClientTypeStatus.error));
    }
  }

  FutureOr<void> _mapDeleteClientTypeEventToState(
      DeleteClientType event, Emitter<ClientTypeState> emit) {
    emit(state.copyWith(status: ClientTypeStatus.loading));
    try {
      emit(state.copyWith(status: ClientTypeStatus.success));
    } catch (e) {
      emit(state.copyWith(status: ClientTypeStatus.error));
    }
  }

  FutureOr<void> _mapSelectClientTypeEventToState(
      SelectClientType event, Emitter<ClientTypeState> emit) {
    emit(state.copyWith(status: ClientTypeStatus.loading));
    try {
      emit(state.copyWith(status: ClientTypeStatus.success, idSelected: null));
    } catch (e) {
      emit(state.copyWith(status: ClientTypeStatus.error));
    }
  }

  @override
  void onChange(Change<ClientTypeState> change) {
    super.onChange(change);
    if (kDebugMode) {
      print("Change: $change");
    }
  }

  @override
  void onEvent(ClientTypeEvent event) {
    super.onEvent(event);
    if (kDebugMode) {
      print("Event: $event");
    }
  }

  @override
  void onTransition(Transition<ClientTypeEvent, ClientTypeState> transition) {
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
