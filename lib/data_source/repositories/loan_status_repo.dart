import 'package:smart_loans/data_source/daos/implementations/loan_status_dao_impl.dart';
import 'package:smart_loans/data_source/models/loan_status_model.dart';

class LoanStatusRepo {
  static Future<LoanStatusModel> fetch(int loanStatusId) async {
    var loanStatusDao = LoanStatusDaoImpl();
    var loanStatusMap = await loanStatusDao.fetch(loanStatusId);
    return LoanStatusModel.fromJson(loanStatusMap);
  }

  static Future<List<LoanStatusModel>> fetchAll(
      {Map<String, dynamic>? body}) async {
    List<LoanStatusModel> loanStatuses;
    try {
      var loanStatusDao = LoanStatusDaoImpl();
      var responseList = await loanStatusDao.fetchAll();
      loanStatuses =
          responseList.map((doc) => LoanStatusModel.fromJson(doc)).toList();
    } finally {}
    return loanStatuses;
  }

  static Future post(LoanStatusModel loanStatus) async {
    var loanStatusDao = LoanStatusDaoImpl();
    var loanStatusMap = await loanStatusDao.post(loanStatus.toJson());
    return LoanStatusModel.fromJson(loanStatusMap);
  }

  static Future put(LoanStatusModel loanStatus, int loanStatusId) async {
    var loanStatusDao = LoanStatusDaoImpl();
    var loanStatusMap =
        await loanStatusDao.put(loanStatus.toJson(), loanStatusId);
    return LoanStatusModel.fromJson(loanStatusMap);
  }

  static Future<List<LoanStatusModel>> search(String search) async {
    var loanStatusDao = LoanStatusDaoImpl();
    var responseList = await loanStatusDao.search(search);
    var loanStatuses =
        responseList.map((doc) => LoanStatusModel.fromJson(doc)).toList();
    return loanStatuses;
  }

  static Future<List<LoanStatusModel>> delete(int loanStatusId) async {
    var loanStatusDao = LoanStatusDaoImpl();
    var responseList = await loanStatusDao.delete(loanStatusId);
    var loanStatuses =
        responseList.map((doc) => LoanStatusModel.fromJson(doc)).toList();
    return loanStatuses;
  }

  static Future<List<LoanStatusModel>> deleteMultiple(
      List<int> loanStatusIds) async {
    var loanStatusDao = LoanStatusDaoImpl();
    var responseList = await loanStatusDao.deleteMultiple(loanStatusIds);
    var loanStatuses =
        responseList.map((doc) => LoanStatusModel.fromJson(doc)).toList();
    return loanStatuses;
  }
}
