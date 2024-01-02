import 'package:smart_loans/data_source/daos/implementations/loan_dao_impl.dart';
import 'package:smart_loans/data_source/models/loan_model.dart';

class LoanRepo {
  static Future<LoanModel> fetch(int loanId) async {
    var loanRepo = LoanDaoImpl();
    var loanMap = await loanRepo.fetch(loanId);
    return LoanModel.fromJson(loanMap);
  }

  static Future<List<LoanModel>> fetchAll({Map<String, dynamic>? body}) async {
    var loanRepo = LoanDaoImpl();
    var responseList = await loanRepo.fetchAll();
    var loans = responseList.map((doc) => LoanModel.fromJson(doc)).toList();
    return loans;
  }

  static Future post(LoanModel loan) async {
    var loanRepo = LoanDaoImpl();
    var loanMap = await loanRepo.post(loan.toJson());
    return LoanModel.fromJson(loanMap);
  }

  static Future put(LoanModel loan, int loanId) async {
    var loanRepo = LoanDaoImpl();
    var loanMap = await loanRepo.put(loan.toJson(), loanId);
    return LoanModel.fromJson(loanMap);
  }

  static Future<List<LoanModel>> search(String search) async {
    var loanRepo = LoanDaoImpl();
    var responseList = await loanRepo.search(search);
    var loans = responseList.map((doc) => LoanModel.fromJson(doc)).toList();
    return loans;
  }

  static Future<List<LoanModel>> delete(int loanId) async {
    var loanRepo = LoanDaoImpl();
    var responseList = await loanRepo.delete(loanId);
    var loans = responseList.map((doc) => LoanModel.fromJson(doc)).toList();
    return loans;
  }

  static Future<List<LoanModel>> deleteMultiple(List<int> loanIds) async {
    var loanRepo = LoanDaoImpl();
    var responseList = await loanRepo.deleteMultiple(loanIds);
    var loans = responseList.map((doc) => LoanModel.fromJson(doc)).toList();
    return loans;
  }
}
