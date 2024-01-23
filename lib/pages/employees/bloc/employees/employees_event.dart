part of 'employees_bloc.dart';

abstract class EmployeesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetEmployees extends EmployeesEvent {}


class CreateEmployee extends EmployeesEvent {
  CreateEmployee(this.employee);

  final EmployeeModel employee;

  @override
  List<Object?> get props => [employee];
}

class UpdateEmployee extends EmployeesEvent {
  UpdateEmployee(this.idSelected, this.employee);

  final int idSelected;
  final EmployeeModel employee;

  @override
  List<Object?> get props => [idSelected, employee];
}

class DeleteEmployee extends EmployeesEvent {
  DeleteEmployee(this.idSelected);

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class SelectEmployee extends EmployeesEvent {
  SelectEmployee(this.idSelected);

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class Success extends EmployeesEvent {}
