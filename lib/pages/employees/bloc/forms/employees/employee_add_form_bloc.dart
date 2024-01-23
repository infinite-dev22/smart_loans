import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:smart_loans/data_source/models/employee_model.dart';
import 'package:smart_loans/data_source/models/role_model.dart';
import 'package:smart_loans/data_source/repositories/employee_repo.dart';
import 'package:smart_loans/data_source/repositories/roles_repo.dart';

part 'employee_add_form_event.dart';
part 'employee_add_form_state.dart';

class EmployeeAddFormBloc
    extends Bloc<EmployeeAddFormEvent, EmployeeAddFormState> {
  EmployeeAddFormBloc() : super(const EmployeeAddFormState()) {
    on<PostEmployee>(_mapPostEmployeeAddFormEventToState);
    on<PutEmployee>(_mapPutEmployeeAddFormEventToState);
    on<GetRoles>(_mapLoadRoleEventToState);
    on<SetIndividual>(_mapSetIndividualEventToState);
    on<SetCompany>(_mapSetCompanyEventToState);
  }

  _mapLoadRoleEventToState(
      GetRoles event, Emitter<EmployeeAddFormState> emit) async {
    emit(state.copyWith(status: EmployeeAddFormStatus.loading));
    await RoleRepo.fetchAll().then((roles) {
      emit(state.copyWith(status: EmployeeAddFormStatus.success, roles: roles));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: EmployeeAddFormStatus.error));
    });
  }

  _mapPostEmployeeAddFormEventToState(
      PostEmployee event, Emitter<EmployeeAddFormState> emit) async {
    emit(state.copyWith(status: EmployeeAddFormStatus.loading));
    await EmployeeRepo.post(event.employee).then((employee) {
      emit(state.copyWith(
          status: EmployeeAddFormStatus.success, employee: employee));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: EmployeeAddFormStatus.error));
    });
  }

  _mapPutEmployeeAddFormEventToState(
      PutEmployee event, Emitter<EmployeeAddFormState> emit) async {
    emit(state.copyWith(status: EmployeeAddFormStatus.loading));
    await EmployeeRepo.put(event.employee, event.idSelected).then((employee) {
      emit(state.copyWith(
          status: EmployeeAddFormStatus.success, employee: employee));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: EmployeeAddFormStatus.error));
    });
  }

  _mapSetIndividualEventToState(
      SetIndividual event, Emitter<EmployeeAddFormState> emit) async {
    emit(state.copyWith(status: EmployeeAddFormStatus.individual));
  }

  _mapSetCompanyEventToState(
      SetCompany event, Emitter<EmployeeAddFormState> emit) async {
    emit(state.copyWith(status: EmployeeAddFormStatus.company));
  }

  @override
  void onChange(Change<EmployeeAddFormState> change) {
    super.onChange(change);
    if (kDebugMode) {
      print("Change: $change");
    }
  }

  @override
  void onEvent(EmployeeAddFormEvent event) {
    super.onEvent(event);
    if (kDebugMode) {
      print("Event: $event");
    }
  }

  @override
  void onTransition(
      Transition<EmployeeAddFormEvent, EmployeeAddFormState> transition) {
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
