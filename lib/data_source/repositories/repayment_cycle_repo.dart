import 'package:smart_loans/data_source/daos/implementations/repayment_cycle_dao_impl.dart';
import 'package:smart_loans/data_source/models/repayment_cycle_model.dart';

class RepaymentCycleRepo {
  static Future<RepaymentCycleModel> fetch(int repaymentCycleId) async {
    var repaymentCycleDao = RepaymentCycleDaoImpl();
    var repaymentCycleMap = await repaymentCycleDao.fetch(repaymentCycleId);
    return RepaymentCycleModel.fromJson(repaymentCycleMap);
  }

  static Future<List<RepaymentCycleModel>> fetchAll(
      {Map<String, dynamic>? body}) async {
    List<RepaymentCycleModel> repaymentCycles;
    try {
      var repaymentCycleDao = RepaymentCycleDaoImpl();
      var responseList = await repaymentCycleDao.fetchAll();
      repaymentCycles =
          responseList.map((doc) => RepaymentCycleModel.fromJson(doc)).toList();
    } finally {}
    return repaymentCycles;
  }

  static Future post(RepaymentCycleModel repaymentCycle) async {
    var repaymentCycleDao = RepaymentCycleDaoImpl();
    var repaymentCycleMap =
        await repaymentCycleDao.post(repaymentCycle.toJson());
    return RepaymentCycleModel.fromJson(repaymentCycleMap);
  }

  static Future put(
      RepaymentCycleModel repaymentCycle, int repaymentCycleId) async {
    var repaymentCycleDao = RepaymentCycleDaoImpl();
    var repaymentCycleMap =
        await repaymentCycleDao.put(repaymentCycle.toJson(), repaymentCycleId);
    return RepaymentCycleModel.fromJson(repaymentCycleMap);
  }

  static Future<List<RepaymentCycleModel>> search(String search) async {
    var repaymentCycleDao = RepaymentCycleDaoImpl();
    var responseList = await repaymentCycleDao.search(search);
    var repaymentCycles =
        responseList.map((doc) => RepaymentCycleModel.fromJson(doc)).toList();
    return repaymentCycles;
  }

  static Future<List<RepaymentCycleModel>> delete(int repaymentCycleId) async {
    var repaymentCycleDao = RepaymentCycleDaoImpl();
    var responseList = await repaymentCycleDao.delete(repaymentCycleId);
    var repaymentCycles =
        responseList.map((doc) => RepaymentCycleModel.fromJson(doc)).toList();
    return repaymentCycles;
  }

  static Future<List<RepaymentCycleModel>> deleteMultiple(
      List<int> repaymentCycleIds) async {
    var repaymentCycleDao = RepaymentCycleDaoImpl();
    var responseList =
        await repaymentCycleDao.deleteMultiple(repaymentCycleIds);
    var repaymentCycles =
        responseList.map((doc) => RepaymentCycleModel.fromJson(doc)).toList();
    return repaymentCycles;
  }
}
