
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smart_loans/data_source/models/employee_model.dart';

part 'employee_event.dart';
part 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  EmployeeBloc() : super(EmployeeInitial()) {
    on<GetEmployees>(_mapGetEmployeesEventToState);
    on<GetEmployee>(_mapGetEmployeeEventToState);
    on<CreateEmployee>(_mapCreateEmployeeCreateClientEventToState);
    on<UpdateEmployee>(_mapUpdateEmployeeEventToState);
    on<DeleteEmployee>(_mapDeleteEmployeeEventToState);
    on<SelectEmployee>(_mapSelectEmployeeEventToState);
  }
  
  FutureOr<void> _mapGetEmployeesEventToState(GetEmployees event, Emitter<EmployeeState> emit) {
        emit(state.copyWith(status: EmployeeStatus.loading));
    try {
      emit(state.copyWith(status: EmployeeStatus.success, employees: null));
    } catch (e) {
      emit(state.copyWith(status: EmployeeStatus.error));
    }
  }

  FutureOr<void> _mapGetEmployeeEventToState(GetEmployee event, Emitter<EmployeeState> emit) {
           emit(state.copyWith(status: EmployeeStatus.loading));

    try{
      emit(state.copyWith(status: EmployeeStatus.success, employee: null));
    }catch(e){
      emit(state.copyWith(status: EmployeeStatus.error));
    }
  }

  FutureOr<void> _mapCreateEmployeeCreateClientEventToState(CreateEmployee event, Emitter<EmployeeState> emit) {
          emit(state.copyWith(status: EmployeeStatus.loading));
try{
      emit(state.copyWith(status: EmployeeStatus.success, employee: null));
    }catch(e){
      emit(state.copyWith(status: EmployeeStatus.error));
    }
  }

  FutureOr<void> _mapUpdateEmployeeEventToState(UpdateEmployee event, Emitter<EmployeeState> emit) {
          emit(state.copyWith(status: EmployeeStatus.loading));
try{
      emit(state.copyWith(status: EmployeeStatus.success, employee: null));
    }catch(e){
      emit(state.copyWith(status: EmployeeStatus.error));
    }
  }

  FutureOr<void> _mapDeleteEmployeeEventToState(DeleteEmployee event, Emitter<EmployeeState> emit) {
          emit(state.copyWith(status: EmployeeStatus.loading));
try{
      emit(state.copyWith(status: EmployeeStatus.success));
    }catch(e){
      emit(state.copyWith(status: EmployeeStatus.error));
    }
  }

  FutureOr<void> _mapSelectEmployeeEventToState(SelectEmployee event, Emitter<EmployeeState> emit) {
          emit(state.copyWith(status: EmployeeStatus.loading));
try{
      emit(state.copyWith(status: EmployeeStatus.success, idSelected: null));
    }catch(e){
      emit(state.copyWith(status: EmployeeStatus.error));
    }
  }
}

