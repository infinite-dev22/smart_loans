part of 'employee_add_form_bloc.dart';

enum EmployeeAddFormStatus {
  initial,
  success,
  error,
  loading,
  selected,
  noData,
  individual,
  company
}

extension EmployeeAddFormStatusX on EmployeeAddFormStatus {
  bool get isInitial => this == EmployeeAddFormStatus.initial;

  bool get isSuccess => this == EmployeeAddFormStatus.success;

  bool get isError => this == EmployeeAddFormStatus.error;

  bool get isLoading => this == EmployeeAddFormStatus.loading;

  bool get isSelected => this == EmployeeAddFormStatus.selected;

  bool get showIndividual => this == EmployeeAddFormStatus.initial;

  bool get showCompany => this == EmployeeAddFormStatus.company;
}

//
@immutable
class EmployeeAddFormState extends Equatable {
  final EmployeeModel? employee;
  final List<RoleModel>? roles;
  final EmployeeAddFormStatus status;
  final int? idSelected;

  const EmployeeAddFormState({
    this.employee,
    this.roles,
    this.status = EmployeeAddFormStatus.initial,
    this.idSelected,
  });

  @override
  List<Object?> get props => [employee, roles, status, idSelected];

  // Copy state.
  EmployeeAddFormState copyWith({
    EmployeeModel? employee,
    final List<RoleModel>? roles,
    EmployeeAddFormStatus? status,
    int? idSelected,
  }) {
    return EmployeeAddFormState(
      employee: employee ?? this.employee,
      roles: roles ?? this.roles,
      status: status ?? this.status,
      idSelected: idSelected ?? this.idSelected,
    );
  }
}

class EmployeeInitial extends EmployeeAddFormState {}

class EmployeeLoading extends EmployeeAddFormState {}

class EmployeeSuccess extends EmployeeAddFormState {
  const EmployeeSuccess(employee);

  @override
  List<Object?> get props => [employee];
}

class EmployeeError extends EmployeeAddFormState {}

class EmployeeNoData extends EmployeeAddFormState {}

class RoleLoading extends EmployeeAddFormState {}

class RoleError extends EmployeeAddFormState {}

class RoleSuccess extends EmployeeAddFormState {
  const RoleSuccess(roles);

  @override
  List<Object?> get props => [roles];
}

class ShowCompany extends EmployeeAddFormState {}

class ShowIndividual extends EmployeeAddFormState {}
