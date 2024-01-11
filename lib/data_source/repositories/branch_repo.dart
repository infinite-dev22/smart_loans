import 'package:smart_loans/data_source/daos/implementations/branch_dao_impl.dart';
import 'package:smart_loans/data_source/models/branch_model.dart';

class BranchRepo {
  static Future<BranchModel> fetch(int branchId) async {
    var branchDao = BranchDaoImpl();
    var branchMap = await branchDao.fetch(branchId);
    return BranchModel.fromJson(branchMap);
  }

  static Future<List<BranchModel>> fetchAll(
      {Map<String, dynamic>? body}) async {
    List<BranchModel> branches;
    try {
      var branchDao = BranchDaoImpl();
      var responseList = await branchDao.fetchAll();
      branches = responseList.map((doc) => BranchModel.fromJson(doc)).toList();
    } finally {}
    return branches;
  }

  static Future post(BranchModel branch) async {
    var branchDao = BranchDaoImpl();
    var branchMap = await branchDao.post(branch.toJson());
    return BranchModel.fromJson(branchMap);
  }

  static Future put(BranchModel branch, int branchId) async {
    var branchDao = BranchDaoImpl();
    var branchMap = await branchDao.put(branch.toJson(), branchId);
    return BranchModel.fromJson(branchMap);
  }

  static Future<List<BranchModel>> search(String search) async {
    var branchDao = BranchDaoImpl();
    var responseList = await branchDao.search(search);
    var branches =
        responseList.map((doc) => BranchModel.fromJson(doc)).toList();
    return branches;
  }

  static Future<List<BranchModel>> delete(int branchId) async {
    var branchDao = BranchDaoImpl();
    var responseList = await branchDao.delete(branchId);
    var branches =
        responseList.map((doc) => BranchModel.fromJson(doc)).toList();
    return branches;
  }

  static Future<List<BranchModel>> deleteMultiple(List<int> branchIds) async {
    var branchDao = BranchDaoImpl();
    var responseList = await branchDao.deleteMultiple(branchIds);
    var branches =
        responseList.map((doc) => BranchModel.fromJson(doc)).toList();
    return branches;
  }
}
