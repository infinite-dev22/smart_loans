import 'package:smart_loans/data_source/daos/implementations/loan_type_dao_impl.dart';
import 'package:smart_loans/data_source/models/loan_type_model.dart';

class LoanTypeRepo {
  static Future<LoanTypeModel> fetch(int loanTypeId) async {
    var loanTypeDao = LoanTypeDaoImpl();
    var loanTypeMap = await loanTypeDao.fetch(loanTypeId);
    return LoanTypeModel.fromJson(loanTypeMap);
  }

  static Future<List<LoanTypeModel>> fetchAll(
      {Map<String, dynamic>? body}) async {
    List<LoanTypeModel> loanTypes;
    try {
      var loanTypeDao = LoanTypeDaoImpl();
      var responseList = await loanTypeDao.fetchAll();
      loanTypes =
          responseList.map((doc) => LoanTypeModel.fromJson(doc)).toList();
    } finally {}
    return loanTypes;
  }

  static Future post(LoanTypeModel loanType) async {
    var loanTypeDao = LoanTypeDaoImpl();
    var loanTypeMap = await loanTypeDao.post(loanType.toJson());
    return LoanTypeModel.fromJson(loanTypeMap);
  }

  static Future put(LoanTypeModel loanType, int loanTypeId) async {
    var loanTypeDao = LoanTypeDaoImpl();
    var loanTypeMap = await loanTypeDao.put(loanType.toJson(), loanTypeId);
    return LoanTypeModel.fromJson(loanTypeMap);
  }

  static Future<List<LoanTypeModel>> search(String search) async {
    var loanTypeDao = LoanTypeDaoImpl();
    var responseList = await loanTypeDao.search(search);
    var loanTypes =
        responseList.map((doc) => LoanTypeModel.fromJson(doc)).toList();
    return loanTypes;
  }

  static Future<List<LoanTypeModel>> delete(int loanTypeId) async {
    var loanTypeDao = LoanTypeDaoImpl();
    var responseList = await loanTypeDao.delete(loanTypeId);
    var loanTypes =
        responseList.map((doc) => LoanTypeModel.fromJson(doc)).toList();
    return loanTypes;
  }

  static Future<List<LoanTypeModel>> deleteMultiple(
      List<int> loanTypeIds) async {
    var loanTypeDao = LoanTypeDaoImpl();
    var responseList = await loanTypeDao.deleteMultiple(loanTypeIds);
    var loanTypes =
        responseList.map((doc) => LoanTypeModel.fromJson(doc)).toList();
    return loanTypes;
  }
}
