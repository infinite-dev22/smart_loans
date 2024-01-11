import 'package:smart_loans/data_source/daos/implementations/loan_schedule_dao_impl.dart';
import 'package:smart_loans/data_source/models/loan_schedule_model.dart';

class LoanScheduleRepo {
  static Future<LoanScheduleModel> fetch(int loanScheduleId) async {
    var loanScheduleDao = LoanScheduleDaoImpl();
    var loanScheduleMap = await loanScheduleDao.fetch(loanScheduleId);
    return LoanScheduleModel.fromJson(loanScheduleMap);
  }

  static Future<List<LoanScheduleModel>> fetchAll(int loanScheduleId) async {
    List<LoanScheduleModel> loanSchedules;
    try {
      var loanScheduleDao = LoanScheduleDaoImpl();
      var responseList = await loanScheduleDao.fetchAll(loanScheduleId);
      loanSchedules =
          responseList.map((doc) => LoanScheduleModel.fromJson(doc)).toList();
    } finally {}
    return loanSchedules;
  }

  static Future post(LoanScheduleModel loanSchedule) async {
    var loanScheduleDao = LoanScheduleDaoImpl();
    var loanScheduleMap = await loanScheduleDao.post(loanSchedule.toJson());
    return LoanScheduleModel.fromJson(loanScheduleMap);
  }

  static Future put(LoanScheduleModel loanSchedule, int loanScheduleId) async {
    var loanScheduleDao = LoanScheduleDaoImpl();
    var loanScheduleMap =
        await loanScheduleDao.put(loanSchedule.toJson(), loanScheduleId);
    return LoanScheduleModel.fromJson(loanScheduleMap);
  }

  static Future<List<LoanScheduleModel>> search(String search) async {
    var loanScheduleDao = LoanScheduleDaoImpl();
    var responseList = await loanScheduleDao.search(search);
    var loanSchedules =
        responseList.map((doc) => LoanScheduleModel.fromJson(doc)).toList();
    return loanSchedules;
  }

  static Future<List<LoanScheduleModel>> delete(int loanScheduleId) async {
    var loanScheduleDao = LoanScheduleDaoImpl();
    var responseList = await loanScheduleDao.delete(loanScheduleId);
    var loanSchedules =
        responseList.map((doc) => LoanScheduleModel.fromJson(doc)).toList();
    return loanSchedules;
  }

  static Future<List<LoanScheduleModel>> deleteMultiple(
      List<int> loanScheduleIds) async {
    var loanScheduleDao = LoanScheduleDaoImpl();
    var responseList = await loanScheduleDao.deleteMultiple(loanScheduleIds);
    var loanSchedules =
        responseList.map((doc) => LoanScheduleModel.fromJson(doc)).toList();
    return loanSchedules;
  }
}
