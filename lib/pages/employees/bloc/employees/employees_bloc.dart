import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:smart_loans/data_source/models/employee_model.dart';
import 'package:smart_loans/data_source/repositories/employee_repo.dart';

part 'employees_event.dart';
part 'employees_state.dart';

class EmployeesBloc extends Bloc<EmployeesEvent, EmployeesState> {
  EmployeesBloc() : super(const EmployeesState()) {
    on<GetEmployees>(_mapGetEmployeesEventToState);
    on<CreateEmployee>(_mapCreateEmployeesEventToState);
    on<UpdateEmployee>(_mapUpdateEmployeeEventToState);
    on<DeleteEmployee>(_mapDeleteEmployeeEventToState);
  }

  Future<FutureOr<void>> _mapGetEmployeesEventToState(
      GetEmployees event, Emitter<EmployeesState> emit) async {
    emit(state.copyWith(status: EmployeesStatus.loading));
    await EmployeeRepo.fetchAll().then((employees) {
      emit(
          state.copyWith(status: EmployeesStatus.success, employees: employees));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: EmployeesStatus.error));
    });
  }

  Future<FutureOr<void>> _mapCreateEmployeesEventToState(
      CreateEmployee event, Emitter<EmployeesState> emit) async {
    emit(state.copyWith(status: EmployeesStatus.loading));
    await EmployeeRepo.post(event.employee).then((employee) {
      emit(state.copyWith(status: EmployeesStatus.success, employee: employee));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: EmployeesStatus.error));
    });
  }

  Future<FutureOr<void>> _mapUpdateEmployeeEventToState(
      UpdateEmployee event, Emitter<EmployeesState> emit) async {
    emit(state.copyWith(status: EmployeesStatus.loading));
    await EmployeeRepo.put(event.employee, event.idSelected).then((employee) {
      emit(state.copyWith(status: EmployeesStatus.success, employee: employee));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: EmployeesStatus.error));
    });
  }

  FutureOr<void> _mapDeleteEmployeeEventToState(
      DeleteEmployee event, Emitter<EmployeesState> emit) {
    emit(state.copyWith(status: EmployeesStatus.loading));
    try {
      emit(state.copyWith(status: EmployeesStatus.success));
    } catch (e) {
      emit(state.copyWith(status: EmployeesStatus.error));
    }
  }



  @override
  void onChange(Change<EmployeesState> change) {
    super.onChange(change);
    if (kDebugMode) {
      print("Change: $change");
    }
  }

  @override
  void onEvent(EmployeesEvent event) {
    super.onEvent(event);
    if (kDebugMode) {
      print("Event: $event");
    }
  }

  @override
  void onTransition(Transition<EmployeesEvent, EmployeesState> transition) {
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
