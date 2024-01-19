import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:smart_loans/data_source/models/client_model.dart';
import 'package:smart_loans/data_source/models/role_model.dart';
import 'package:smart_loans/data_source/repositories/client_repo.dart';
import 'package:smart_loans/data_source/repositories/roles_repo.dart';

part 'client_add_form_event.dart';
part 'client_add_form_state.dart';

class ClientFormBloc extends Bloc<ClientFormEvent, ClientFormState> {
  ClientFormBloc() : super(const ClientFormState()) {
    on<GetFormClient>(_mapGetClientEventToState);
    on<PostClient>(_mapPostClientAddFormEventToState);
    on<PutClient>(_mapPutClientAddFormEventToState);
    on<SetIndividual>(_mapSetIndividualEventToState);
    on<SetCompany>(_mapSetCompanyEventToState);
  }

  _mapGetClientEventToState(GetFormClient event, Emitter<ClientFormState> emit) async {
    emit(state.copyWith(status: ClientFormStatus.loading));
    await ClientRepo.fetch(event.clientId).then((client) {
      emit(state.copyWith(status: ClientFormStatus.success, client: client));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: ClientFormStatus.error));
    });
  }

  _mapPostClientAddFormEventToState(
      PostClient event, Emitter<ClientFormState> emit) async {
    emit(state.copyWith(status: ClientFormStatus.loading));
    await ClientRepo.post(event.client).then((client) {
      emit(state.copyWith(status: ClientFormStatus.success, client: client));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: ClientFormStatus.error));
    });
  }

  _mapPutClientAddFormEventToState(
      PutClient event, Emitter<ClientFormState> emit) async {
    emit(state.copyWith(status: ClientFormStatus.loading));
    await ClientRepo.put(event.client, event.idSelected).then((client) {
      emit(state.copyWith(status: ClientFormStatus.success, client: client));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: ClientFormStatus.error));
    });
  }

  _mapSetIndividualEventToState(
      SetIndividual event, Emitter<ClientFormState> emit) async {
    emit(state.copyWith(status: ClientFormStatus.individual));
  }

  _mapSetCompanyEventToState(
      SetCompany event, Emitter<ClientFormState> emit) async {
    emit(state.copyWith(status: ClientFormStatus.company));
  }

  @override
  void onChange(Change<ClientFormState> change) {
    super.onChange(change);
    if (kDebugMode) {
      print("Change: $change");
    }
  }

  @override
  void onEvent(ClientFormEvent event) {
    super.onEvent(event);
    if (kDebugMode) {
      print("Event: $event");
    }
  }

  @override
  void onTransition(
      Transition<ClientFormEvent, ClientFormState> transition) {
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
