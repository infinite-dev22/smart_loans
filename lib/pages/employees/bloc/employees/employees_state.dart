part of 'employees_bloc.dart';

enum EmployeesStatus { initial, success, error, loading, selected, noData }

extension EmployeesStatusX on EmployeesStatus {
  bool get isInitial => this == EmployeesStatus.initial;

  bool get isSuccess => this == EmployeesStatus.success;

  bool get isError => this == EmployeesStatus.error;

  bool get isLoading => this == EmployeesStatus.loading;

  bool get isSelected => this == EmployeesStatus.selected;
}

class EmployeesState extends Equatable {
  final List<EmployeeModel>? employees;
  final EmployeeModel? employee;
  final EmployeesStatus status;
  final int? idSelected;

  const EmployeesState({
    List<EmployeeModel>? employees,
    this.employee,
    this.status = EmployeesStatus.initial,
    this.idSelected = 0,
  }) : employees = employees ?? const [];

  @override
  List<Object?> get props => [employees, employee, status, idSelected];

  // Copy state

  EmployeesState copyWith({
    List<EmployeeModel>? employees,
    EmployeeModel? employee,
    EmployeesStatus? status,
    int? idSelected,
  }) {
    return EmployeesState(
      employees: employees ?? this.employees,
      employee: employee ?? this.employee,
      status: status ?? this.status,
      idSelected: idSelected ?? this.idSelected,
    );
  }
}

class EmployeesInitial extends EmployeesState {}

class EmployeesLoading extends EmployeesState {}

class EmployeesSuccess extends EmployeesState {
  const EmployeesSuccess(employees);

  @override
  List<Object?> get props => [employees];
}

class EmployeesError extends EmployeesState {}

class EmployeesNoData extends EmployeesState {}

class EmployeeInitial extends EmployeesState {}

class EmployeeLoading extends EmployeesState {}

class EmployeeSuccess extends EmployeesState {
  const EmployeeSuccess(employee);

  @override
  List<Object?> get props => [employee];
}

class EmployeePosted extends EmployeesState {}

class EmployeeError extends EmployeesState {}

class EmployeeNoData extends EmployeesState {}
