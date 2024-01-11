import 'package:smart_loans/data_source/daos/implementations/interest_method_dao_impl.dart';
import 'package:smart_loans/data_source/models/interest_method_model.dart';

class InterestMethodRepo {
  static Future<InterestMethodModel> fetch(int interestMethodId) async {
    var interestMethodDao = InterestMethodDaoImpl();
    var interestMethodMap = await interestMethodDao.fetch(interestMethodId);
    return InterestMethodModel.fromJson(interestMethodMap);
  }

  static Future<List<InterestMethodModel>> fetchAll(
      {Map<String, dynamic>? body}) async {
    List<InterestMethodModel> interestMethods;
    try {
      var interestMethodDao = InterestMethodDaoImpl();
      var responseList = await interestMethodDao.fetchAll();
      interestMethods =
          responseList.map((doc) => InterestMethodModel.fromJson(doc)).toList();
    } finally {}
    return interestMethods;
  }

  static Future post(InterestMethodModel interestMethod) async {
    var interestMethodDao = InterestMethodDaoImpl();
    var interestMethodMap =
        await interestMethodDao.post(interestMethod.toJson());
    return InterestMethodModel.fromJson(interestMethodMap);
  }

  static Future put(
      InterestMethodModel interestMethod, int interestMethodId) async {
    var interestMethodDao = InterestMethodDaoImpl();
    var interestMethodMap =
        await interestMethodDao.put(interestMethod.toJson(), interestMethodId);
    return InterestMethodModel.fromJson(interestMethodMap);
  }

  static Future<List<InterestMethodModel>> search(String search) async {
    var interestMethodDao = InterestMethodDaoImpl();
    var responseList = await interestMethodDao.search(search);
    var interestMethods =
        responseList.map((doc) => InterestMethodModel.fromJson(doc)).toList();
    return interestMethods;
  }

  static Future<List<InterestMethodModel>> delete(int interestMethodId) async {
    var interestMethodDao = InterestMethodDaoImpl();
    var responseList = await interestMethodDao.delete(interestMethodId);
    var interestMethods =
        responseList.map((doc) => InterestMethodModel.fromJson(doc)).toList();
    return interestMethods;
  }

  static Future<List<InterestMethodModel>> deleteMultiple(
      List<int> interestMethodIds) async {
    var interestMethodDao = InterestMethodDaoImpl();
    var responseList =
        await interestMethodDao.deleteMultiple(interestMethodIds);
    var interestMethods =
        responseList.map((doc) => InterestMethodModel.fromJson(doc)).toList();
    return interestMethods;
  }
}
