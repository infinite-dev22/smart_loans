import 'package:get_storage/get_storage.dart';
import 'package:smart_loans/data_source/models/client_model.dart';
import 'package:smart_loans/data_source/models/employee_model.dart';
import 'package:smart_loans/data_source/models/interest_model.dart';
import 'package:smart_loans/data_source/models/loan_model.dart';
import 'package:smart_loans/data_source/models/loan_process_model.dart';
import 'package:smart_loans/data_source/models/loan_type_model.dart';

var client = ClientModel();
var employee = EmployeeModel();
var loan = LoanModel();
var loanType = LoanTypeModel();
var interest = InterestModel();
var loanProcess = LoanProcessModel();
final box = GetStorage();

GetStorage getLocalStorage() {
  return box;
}
