import 'package:smart_loans/data_source/daos/implementations/loan_category_dao_impl.dart';
import 'package:smart_loans/data_source/models/loan_category_model.dart';

class LoanCategoryRepo {
  static Future<LoanCategoryModel> fetch(int loanCategoryId) async {
    var loanCategoryDao = LoanCategoryDaoImpl();
    var loanCategoryMap = await loanCategoryDao.fetch(loanCategoryId);
    return LoanCategoryModel.fromJson(loanCategoryMap);
  }

  static Future<List<LoanCategoryModel>> fetchAll(
      {Map<String, dynamic>? body}) async {
    List<LoanCategoryModel> loanCategories;
    try {
      var loanCategoryDao = LoanCategoryDaoImpl();
      var responseList = await loanCategoryDao.fetchAll();
      loanCategories =
          responseList.map((doc) => LoanCategoryModel.fromJson(doc)).toList();
    } finally {}
    return loanCategories;
  }

  static Future post(LoanCategoryModel loanCategory) async {
    var loanCategoryDao = LoanCategoryDaoImpl();
    var loanCategoryMap = await loanCategoryDao.post(loanCategory.toJson());
    return LoanCategoryModel.fromJson(loanCategoryMap);
  }

  static Future put(LoanCategoryModel loanCategory, int loanCategoryId) async {
    var loanCategoryDao = LoanCategoryDaoImpl();
    var loanCategoryMap =
        await loanCategoryDao.put(loanCategory.toJson(), loanCategoryId);
    return LoanCategoryModel.fromJson(loanCategoryMap);
  }

  static Future<List<LoanCategoryModel>> search(String search) async {
    var loanCategoryDao = LoanCategoryDaoImpl();
    var responseList = await loanCategoryDao.search(search);
    var loanCategories =
        responseList.map((doc) => LoanCategoryModel.fromJson(doc)).toList();
    return loanCategories;
  }

  static Future<List<LoanCategoryModel>> delete(int loanCategoryId) async {
    var loanCategoryDao = LoanCategoryDaoImpl();
    var responseList = await loanCategoryDao.delete(loanCategoryId);
    var loanCategories =
        responseList.map((doc) => LoanCategoryModel.fromJson(doc)).toList();
    return loanCategories;
  }

  static Future<List<LoanCategoryModel>> deleteMultiple(
      List<int> loanCategoryIds) async {
    var loanCategoryDao = LoanCategoryDaoImpl();
    var responseList = await loanCategoryDao.deleteMultiple(loanCategoryIds);
    var loanCategories =
        responseList.map((doc) => LoanCategoryModel.fromJson(doc)).toList();
    return loanCategories;
  }
}
