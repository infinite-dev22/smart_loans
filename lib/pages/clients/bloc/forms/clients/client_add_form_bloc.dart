import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:smart_loans/data_source/models/client_model.dart';
import 'package:smart_loans/data_source/models/role_model.dart';
import 'package:smart_loans/data_source/repositories/client_repo.dart';
import 'package:smart_loans/data_source/repositories/roles_repo.dart';

part 'client_add_form_event.dart';
part 'client_add_form_state.dart';

class ClientAddFormBloc extends Bloc<ClientAddFormEvent, ClientAddFormState> {
  ClientAddFormBloc() : super(const ClientAddFormState()) {
    on<GetClient>(_mapLoadClientAddFormEventToState);
    on<PostClient>(_mapPostClientAddFormEventToState);
    on<PutClient>(_mapPutClientAddFormEventToState);
    on<GetRoles>(_mapLoadRoleEventToState);
    on<SetIndividual>(_mapSetIndividualEventToState);
    on<SetCompany>(_mapSetCompanyEventToState);
  }

  _mapLoadClientAddFormEventToState(
      GetClient event, Emitter<ClientAddFormState> emit) async {
    emit(state.copyWith(status: ClientAddFormStatus.loading));
    await RoleRepo.fetchAll().then((roles) {
      emit(state.copyWith(status: ClientAddFormStatus.success, roles: roles));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: ClientAddFormStatus.error));
    });
  }

  _mapLoadRoleEventToState(
      GetRoles event, Emitter<ClientAddFormState> emit) async {
    emit(state.copyWith(status: ClientAddFormStatus.loading));
    await RoleRepo.fetchAll().then((roles) {
      emit(state.copyWith(status: ClientAddFormStatus.success, roles: roles));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: ClientAddFormStatus.error));
    });
  }

  _mapPostClientAddFormEventToState(
      PostClient event, Emitter<ClientAddFormState> emit) async {
    emit(state.copyWith(status: ClientAddFormStatus.loading));
    await ClientRepo.post(event.client).then((client) {
      emit(state.copyWith(status: ClientAddFormStatus.success, client: client));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: ClientAddFormStatus.error));
    });
  }

  _mapPutClientAddFormEventToState(
      PutClient event, Emitter<ClientAddFormState> emit) async {
    emit(state.copyWith(status: ClientAddFormStatus.loading));
    await ClientRepo.put(event.client, event.idSelected).then((client) {
      emit(state.copyWith(status: ClientAddFormStatus.success, client: client));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: ClientAddFormStatus.error));
    });
  }

  _mapSetIndividualEventToState(
      SetIndividual event, Emitter<ClientAddFormState> emit) async {
    emit(state.copyWith(status: ClientAddFormStatus.individual));
  }

  _mapSetCompanyEventToState(
      SetCompany event, Emitter<ClientAddFormState> emit) async {
    emit(state.copyWith(status: ClientAddFormStatus.company));
  }

  @override
  void onChange(Change<ClientAddFormState> change) {
    super.onChange(change);
    if (kDebugMode) {
      print("Change: $change");
    }
  }

  @override
  void onEvent(ClientAddFormEvent event) {
    super.onEvent(event);
    if (kDebugMode) {
      print("Event: $event");
    }
  }

  @override
  void onTransition(
      Transition<ClientAddFormEvent, ClientAddFormState> transition) {
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
