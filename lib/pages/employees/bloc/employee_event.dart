part of 'employee_bloc.dart';

abstract class EmployeeEvent extends Equatable {
  @override
  List<Object?> get props => [];
  
}



class GetEmployees extends EmployeeEvent {}

class GetEmployee extends EmployeeEvent {
  GetEmployee(this.idSelected);

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class CreateEmployee extends EmployeeEvent {
  CreateEmployee(this.employee);

  final EmployeeModel employee;

  @override
  List<Object?> get props => [employee];
}

class UpdateEmployee extends EmployeeEvent {
  UpdateEmployee(this.idSelected, this.employee);

  final int idSelected;
  final EmployeeModel employee;

  @override
  List<Object?> get props => [idSelected, employee];
}

class DeleteEmployee extends EmployeeEvent {
  DeleteEmployee(this.idSelected);

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class SelectEmployee extends EmployeeEvent {
  SelectEmployee(this.idSelected);

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class Success extends EmployeeEvent {}
