import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:smart_loans/data_source/models/client_model.dart';
import 'package:smart_loans/data_source/repositories/client_repo.dart';

part 'clients_event.dart';
part 'clients_state.dart';

class ClientsBloc extends Bloc<ClientsEvent, ClientsState> {
  ClientsBloc() : super(const ClientsState()) {
    on<GetClients>(_mapGetClientsEventToState);
    on<DeleteClients>(_mapDeleteClientsEventToState);
    on<SelectClients>(_mapSelectClientsEventToState);
  }

  _mapGetClientsEventToState(
      GetClients event, Emitter<ClientsState> emit) async {
    emit(state.copyWith(status: ClientsStatus.loading));
    await ClientRepo.fetchAll().then((clients) {
      emit(state.copyWith(status: ClientsStatus.success, clients: clients));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: ClientsStatus.error));
    });
  }

  _mapDeleteClientsEventToState(
      DeleteClients event, Emitter<ClientsState> emit) {
    emit(state.copyWith(status: ClientsStatus.loading));
    try {
      emit(state.copyWith(status: ClientsStatus.success));
    } catch (e) {
      emit(state.copyWith(status: ClientsStatus.error));
    }
  }

  _mapSelectClientsEventToState(
      SelectClients event, Emitter<ClientsState> emit) {
    emit(state.copyWith(status: ClientsStatus.loading));
    try {
      emit(state.copyWith(status: ClientsStatus.success, client: event.client));
    } catch (e) {
      emit(state.copyWith(status: ClientsStatus.error));
    }
  }

  @override
  void onChange(Change<ClientsState> change) {
    super.onChange(change);
    if (kDebugMode) {
      print("Change: $change");
    }
  }

  @override
  void onEvent(ClientsEvent event) {
    super.onEvent(event);
    if (kDebugMode) {
      print("Event: $event");
    }
  }

  @override
  void onTransition(Transition<ClientsEvent, ClientsState> transition) {
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
