import 'package:smart_loans/data_source/daos/implementations/loan_duration_dao_impl.dart';
import 'package:smart_loans/data_source/models/loan_duration_model.dart';

class LoanDurationRepo {
  static Future<LoanDurationModel> fetch(int loanDurationId) async {
    var loanDurationDao = LoanDurationDaoImpl();
    var loanDurationMap = await loanDurationDao.fetch(loanDurationId);
    return LoanDurationModel.fromJson(loanDurationMap);
  }

  static Future<List<LoanDurationModel>> fetchAll(
      {Map<String, dynamic>? body}) async {
    List<LoanDurationModel> loanDurations;
    try {
      var loanDurationDao = LoanDurationDaoImpl();
      var responseList = await loanDurationDao.fetchAll();
      loanDurations =
          responseList.map((doc) => LoanDurationModel.fromJson(doc)).toList();
    } finally {}
    return loanDurations;
  }

  static Future post(LoanDurationModel loanDuration) async {
    var loanDurationDao = LoanDurationDaoImpl();
    var loanDurationMap = await loanDurationDao.post(loanDuration.toJson());
    return LoanDurationModel.fromJson(loanDurationMap);
  }

  static Future put(LoanDurationModel loanDuration, int loanDurationId) async {
    var loanDurationDao = LoanDurationDaoImpl();
    var loanDurationMap =
        await loanDurationDao.put(loanDuration.toJson(), loanDurationId);
    return LoanDurationModel.fromJson(loanDurationMap);
  }

  static Future<List<LoanDurationModel>> search(String search) async {
    var loanDurationDao = LoanDurationDaoImpl();
    var responseList = await loanDurationDao.search(search);
    var loanDurations =
        responseList.map((doc) => LoanDurationModel.fromJson(doc)).toList();
    return loanDurations;
  }

  static Future<List<LoanDurationModel>> delete(int loanDurationId) async {
    var loanDurationDao = LoanDurationDaoImpl();
    var responseList = await loanDurationDao.delete(loanDurationId);
    var loanDurations =
        responseList.map((doc) => LoanDurationModel.fromJson(doc)).toList();
    return loanDurations;
  }

  static Future<List<LoanDurationModel>> deleteMultiple(
      List<int> loanDurationIds) async {
    var loanDurationDao = LoanDurationDaoImpl();
    var responseList = await loanDurationDao.deleteMultiple(loanDurationIds);
    var loanDurations =
        responseList.map((doc) => LoanDurationModel.fromJson(doc)).toList();
    return loanDurations;
  }
}
