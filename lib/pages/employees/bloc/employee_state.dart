part of 'employee_bloc.dart';

enum EmployeeStatus { initial, success, error, loading, selected, noData }

extension EmployeeStatusX on EmployeeStatus {
  bool get isInitial => this == EmployeeStatus.initial;

  bool get isSuccess => this == EmployeeStatus.success;

  bool get isError => this == EmployeeStatus.error;

  bool get isLoading => this == EmployeeStatus.loading;

  bool get isSelected => this == EmployeeStatus.selected;
}

class EmployeeState extends Equatable {
  final List<EmployeeModel>? employees;
  final EmployeeModel? employee;
  final EmployeeStatus status;
  final int? idSelected;

  EmployeeState({
    List<EmployeeModel>? employees,
    EmployeeModel? employee,
    EmployeeStatus status = EmployeeStatus.initial,
    int? idSelected = 0,
  })  : employees = employees ?? const [],
        employee = employee,
        status = status,
        idSelected = idSelected;

  @override
  List<Object?> get props => [employees, employee, status, idSelected];

  // Copy state

  EmployeeState copyWith({
    List<EmployeeModel>? employees,
    EmployeeModel? employee,
    EmployeeStatus? status,
    int? idSelected,
  }) {
    return EmployeeState(
      employees: employees ?? this.employees,
      employee: employee ?? this.employee,
      status: status ?? this.status,
      idSelected: idSelected ?? this.idSelected,
    );
  }
}

class EmployeesInitial extends EmployeeState {}

class EmployeesLoading extends EmployeeState {}

class EmployeesSuccess extends EmployeeState {
  EmployeesSuccess(employees);

  @override
  List<Object?> get props => [employees];
}

class EmployeesError extends EmployeeState {}

class EmployeesNoData extends EmployeeState {}

class EmployeeInitial extends EmployeeState {}

class EmployeeLoading extends EmployeeState {}

class EmployeeSuccess extends EmployeeState {
  EmployeeSuccess(employee);

  @override
  List<Object?> get props => [employee];
}

class EmployeePosted extends EmployeeState {}

class EmployeeError extends EmployeeState {}

class EmployeeNoData extends EmployeeState {}
