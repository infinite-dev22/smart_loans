import 'package:smart_loans/data_source/daos/implementations/interest_dao_impl.dart';
import 'package:smart_loans/data_source/models/interest_model.dart';

class InterestRepo {
  static Future<InterestModel> fetch(int interestId) async {
    var interestDao = InterestDaoImpl();
    var interestMap = await interestDao.fetch(interestId);
    return InterestModel.fromJson(interestMap);
  }

  static Future<List<InterestModel>> fetchAll(int loanId) async {
    List<InterestModel> interests;
    try {
      var interestDao = InterestDaoImpl();
      var responseList = await interestDao.fetchAll(loanId);
      interests =
          responseList.map((doc) => InterestModel.fromJson(doc)).toList();
    } finally {}
    return interests;
  }

  static Future post(
    InterestModel interest,
    int loanId,
  ) async {
    var interestDao = InterestDaoImpl();
    await interestDao.post(interest.toJson(), loanId);
    return null;
  }

  static Future put(
    InterestModel interest,
    int interestId,
  ) async {
    var interestDao = InterestDaoImpl();
    var interestMap = await interestDao.put(interest.toJson(), interestId);
    return InterestModel.fromJson(interestMap);
  }

  static Future<List<InterestModel>> search(
    String search,
    int loanId,
  ) async {
    var interestDao = InterestDaoImpl();
    var responseList = await interestDao.search(search, loanId);
    var interests =
        responseList.map((doc) => InterestModel.fromJson(doc)).toList();
    return interests;
  }

  static Future<List<InterestModel>> delete(
    int interestId,
    int loanId,
  ) async {
    var interestDao = InterestDaoImpl();
    var responseList = await interestDao.delete(interestId, loanId);
    var interests =
        responseList.map((doc) => InterestModel.fromJson(doc)).toList();
    return interests;
  }

  static Future<List<InterestModel>> deleteMultiple(
    List<int> interestIds,
    int loanId,
  ) async {
    var interestDao = InterestDaoImpl();
    var responseList = await interestDao.deleteMultiple(interestIds, loanId);
    var interests =
        responseList.map((doc) => InterestModel.fromJson(doc)).toList();
    return interests;
  }
}
