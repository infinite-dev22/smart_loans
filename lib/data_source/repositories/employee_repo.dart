import 'package:smart_loans/data_source/daos/implementations/employee_dao_impl.dart';
import 'package:smart_loans/data_source/models/employee_model.dart';

class EmployeeRepo {
  static Future<EmployeeModel> fetch(int employeeId) async {
    var employeeRepo = EmployeeDaoImpl();
    var employeeMap = await employeeRepo.fetch(employeeId);
    return EmployeeModel.fromJson(employeeMap);
  }

  static Future<List<EmployeeModel>> fetchAll({Map<String, dynamic>? body}) async {
    var employeeRepo = EmployeeDaoImpl();
    var responseList = await employeeRepo.fetchAll();
    var employees = responseList.map((doc) => EmployeeModel.fromJson(doc)).toList();
    return employees;
  }

  static Future post(EmployeeModel employee) async {
    var employeeRepo = EmployeeDaoImpl();
    var employeeMap = await employeeRepo.post(employee.toJson());
    return EmployeeModel.fromJson(employeeMap);
  }

  static Future put(EmployeeModel employee, int employeeId) async {
    var employeeRepo = EmployeeDaoImpl();
    var employeeMap = await employeeRepo.put(employee.toJson(), employeeId);
    return EmployeeModel.fromJson(employeeMap);
  }

  static Future<List<EmployeeModel>> search(String search) async {
    var employeeRepo = EmployeeDaoImpl();
    var responseList = await employeeRepo.search(search);
    var employees = responseList.map((doc) => EmployeeModel.fromJson(doc)).toList();
    return employees;
  }

  static Future<List<EmployeeModel>> delete(int employeeId) async {
    var employeeRepo = EmployeeDaoImpl();
    var responseList = await employeeRepo.delete(employeeId);
    var employees = responseList.map((doc) => EmployeeModel.fromJson(doc)).toList();
    return employees;
  }

  static Future<List<EmployeeModel>> deleteMultiple(List<int> employeeIds) async {
    var employeeRepo = EmployeeDaoImpl();
    var responseList = await employeeRepo.deleteMultiple(employeeIds);
    var employees = responseList.map((doc) => EmployeeModel.fromJson(doc)).toList();
    return employees;
  }
}
