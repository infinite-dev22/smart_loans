import 'package:smart_loans/data_source/daos/implementations/interest_period_dao_impl.dart';
import 'package:smart_loans/data_source/models/interest_period_model.dart';

class InterestPeriodRepo {
  static Future<InterestPeriodModel> fetch(int interestPeriodId) async {
    var interestPeriodDao = InterestPeriodDaoImpl();
    var interestPeriodMap = await interestPeriodDao.fetch(interestPeriodId);
    return InterestPeriodModel.fromJson(interestPeriodMap);
  }

  static Future<List<InterestPeriodModel>> fetchAll(
      {Map<String, dynamic>? body}) async {
    List<InterestPeriodModel> interestPeriods;
    try {
      var interestPeriodDao = InterestPeriodDaoImpl();
      var responseList = await interestPeriodDao.fetchAll();
      interestPeriods =
          responseList.map((doc) => InterestPeriodModel.fromJson(doc)).toList();
    } finally {}
    return interestPeriods;
  }

  static Future post(InterestPeriodModel interestPeriod) async {
    var interestPeriodDao = InterestPeriodDaoImpl();
    var interestPeriodMap =
        await interestPeriodDao.post(interestPeriod.toJson());
    return InterestPeriodModel.fromJson(interestPeriodMap);
  }

  static Future put(
      InterestPeriodModel interestPeriod, int interestPeriodId) async {
    var interestPeriodDao = InterestPeriodDaoImpl();
    var interestPeriodMap =
        await interestPeriodDao.put(interestPeriod.toJson(), interestPeriodId);
    return InterestPeriodModel.fromJson(interestPeriodMap);
  }

  static Future<List<InterestPeriodModel>> search(String search) async {
    var interestPeriodDao = InterestPeriodDaoImpl();
    var responseList = await interestPeriodDao.search(search);
    var interestPeriods =
        responseList.map((doc) => InterestPeriodModel.fromJson(doc)).toList();
    return interestPeriods;
  }

  static Future<List<InterestPeriodModel>> delete(int interestPeriodId) async {
    var interestPeriodDao = InterestPeriodDaoImpl();
    var responseList = await interestPeriodDao.delete(interestPeriodId);
    var interestPeriods =
        responseList.map((doc) => InterestPeriodModel.fromJson(doc)).toList();
    return interestPeriods;
  }

  static Future<List<InterestPeriodModel>> deleteMultiple(
      List<int> interestPeriodIds) async {
    var interestPeriodDao = InterestPeriodDaoImpl();
    var responseList =
        await interestPeriodDao.deleteMultiple(interestPeriodIds);
    var interestPeriods =
        responseList.map((doc) => InterestPeriodModel.fromJson(doc)).toList();
    return interestPeriods;
  }
}
