import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:smart_loans/data_source/models/client_model.dart';

part 'client_event.dart';
part 'client_state.dart';

class ClientBloc extends Bloc<ClientEvent, ClientState> {
  ClientBloc() : super(ClientInitial()) {
    on<GetClients>(_mapGetClientsEventToState);
    on<GetClient>(_mapGetClientEventToState);
    on<CreateClient>(_mapCreateClientEventToState);
    on<UpdateClient>(_mapUpdateClientEventToState);
    on<DeleteClient>(_mapDeleteClientEventToState);
    on<SelectClient>(_mapSelectClientEventToState);
  }

  _mapGetClientsEventToState(GetClients event, Emitter<ClientState> emit) {
    emit(state.copyWith(status: ClientStatus.loading));
    try {
      emit(state.copyWith(status: ClientStatus.success, clients: null));
    } catch (e) {
      emit(state.copyWith(status: ClientStatus.error));
    }
  }

  _mapGetClientEventToState(GetClient event, Emitter<ClientState> emit) {
    emit(state.copyWith(status: ClientStatus.loading));
    try {
      emit(state.copyWith(status: ClientStatus.success, client: null));
    } catch (e) {
      emit(state.copyWith(status: ClientStatus.error));
    }
  }

  _mapCreateClientEventToState(CreateClient event, Emitter<ClientState> emit) {
    emit(state.copyWith(status: ClientStatus.loading));
    try {
      emit(state.copyWith(status: ClientStatus.success, client: null));
    } catch (e) {
      emit(state.copyWith(status: ClientStatus.error));
    }
  }

  _mapUpdateClientEventToState(UpdateClient event, Emitter<ClientState> emit) {
    emit(state.copyWith(status: ClientStatus.loading));
    try {
      emit(state.copyWith(status: ClientStatus.success, client: null));
    } catch (e) {
      emit(state.copyWith(status: ClientStatus.error));
    }
  }

  _mapDeleteClientEventToState(DeleteClient event, Emitter<ClientState> emit) {
    emit(state.copyWith(status: ClientStatus.loading));
    try {
      emit(state.copyWith(status: ClientStatus.success));
    } catch (e) {
      emit(state.copyWith(status: ClientStatus.error));
    }
  }

  _mapSelectClientEventToState(SelectClient event, Emitter<ClientState> emit) {
    emit(state.copyWith(status: ClientStatus.loading));
    try {
      emit(state.copyWith(status: ClientStatus.success, idSelected: null));
    } catch (e) {
      emit(state.copyWith(status: ClientStatus.error));
    }
  }
}
