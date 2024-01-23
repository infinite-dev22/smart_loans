part of 'employee_add_form_bloc.dart';

@immutable
abstract class EmployeeAddFormEvent extends Equatable {
  @override
  List<Object?> get props => [];
}



class PutEmployee extends EmployeeAddFormEvent {
  PutEmployee(this.employee, this.idSelected);

  final int idSelected;
  final EmployeeModel employee;

  @override
  List<Object?> get props => [
        employee,
        idSelected,
      ];
}

class PostEmployee extends EmployeeAddFormEvent {
  PostEmployee(this.employee);

  final EmployeeModel employee;

  @override
  List<Object?> get props => [employee];
}

class GetRoles extends EmployeeAddFormEvent {}

class Success extends EmployeeAddFormEvent {}

class SetIndividual extends EmployeeAddFormEvent {}

class SetCompany extends EmployeeAddFormEvent {}
