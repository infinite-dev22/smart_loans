import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:smart_loans/data_source/models/employee_model.dart';
import 'package:smart_loans/data_source/repositories/employee_repo.dart';

part 'employee_event.dart';
part 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  EmployeeBloc() : super(const EmployeeState()) {
    on<GetEmployees>(_mapGetEmployeesEventToState);
    on<GetEmployee>(_mapGetEmployeeEventToState);
    on<CreateEmployee>(_mapCreateEmployeeCreateClientEventToState);
    on<UpdateEmployee>(_mapUpdateEmployeeEventToState);
    on<DeleteEmployee>(_mapDeleteEmployeeEventToState);
    on<SelectEmployee>(_mapSelectEmployeeEventToState);
  }

  Future<FutureOr<void>> _mapGetEmployeesEventToState(
      GetEmployees event, Emitter<EmployeeState> emit) async {
    emit(state.copyWith(status: EmployeeStatus.loading));
    try {
      var employees = await EmployeeRepo.fetchAll();
      print("Emp Len: ${employees.length}");
      emit(
          state.copyWith(status: EmployeeStatus.success, employees: employees));
    } catch (e) {
      print(e);
      emit(state.copyWith(status: EmployeeStatus.error));
    }
  }

  Future<FutureOr<void>> _mapGetEmployeeEventToState(
      GetEmployee event, Emitter<EmployeeState> emit) async {
    emit(state.copyWith(status: EmployeeStatus.loading));

    try {
      var employee = await EmployeeRepo.fetch(event.idSelected);
      emit(state.copyWith(status: EmployeeStatus.success, employee: employee));
    } catch (e) {
      emit(state.copyWith(status: EmployeeStatus.error));
    }
  }

  Future<FutureOr<void>> _mapCreateEmployeeCreateClientEventToState(
      CreateEmployee event, Emitter<EmployeeState> emit) async {
    emit(state.copyWith(status: EmployeeStatus.loading));
    try {
      var employee = await EmployeeRepo.post(event.employee);

      emit(state.copyWith(status: EmployeeStatus.success, employee: employee));
    } catch (e) {
      emit(state.copyWith(status: EmployeeStatus.error));
    }
  }

  Future<FutureOr<void>> _mapUpdateEmployeeEventToState(
      UpdateEmployee event, Emitter<EmployeeState> emit) async {
    emit(state.copyWith(status: EmployeeStatus.loading));
    try {
      var employee = await EmployeeRepo.put(event.employee, event.idSelected);

      emit(state.copyWith(status: EmployeeStatus.success, employee: employee));
    } catch (e) {
      emit(state.copyWith(status: EmployeeStatus.error));
    }
  }

  FutureOr<void> _mapDeleteEmployeeEventToState(
      DeleteEmployee event, Emitter<EmployeeState> emit) {
    emit(state.copyWith(status: EmployeeStatus.loading));
    try {
      emit(state.copyWith(status: EmployeeStatus.success));
    } catch (e) {
      emit(state.copyWith(status: EmployeeStatus.error));
    }
  }

  FutureOr<void> _mapSelectEmployeeEventToState(
      SelectEmployee event, Emitter<EmployeeState> emit) {
    emit(state.copyWith(status: EmployeeStatus.loading));
    try {
      emit(state.copyWith(status: EmployeeStatus.success, idSelected: null));
    } catch (e) {
      emit(state.copyWith(status: EmployeeStatus.error));
    }
  }

  @override
  void onChange(Change<EmployeeState> change) {
    super.onChange(change);
    if (kDebugMode) {
      print("Change: $change");
    }
  }

  @override
  void onEvent(EmployeeEvent event) {
    super.onEvent(event);
    if (kDebugMode) {
      print("Event: $event");
    }
  }

  @override
  void onTransition(Transition<EmployeeEvent, EmployeeState> transition) {
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
