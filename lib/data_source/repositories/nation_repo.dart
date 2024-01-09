import 'package:smart_loans/data_source/daos/implementations/nation_dao_impl.dart';
import 'package:smart_loans/data_source/models/nation_model.dart';

class NationRepo {
  static Future<NationModel> fetch(int nationId) async {
    var nationDao = NationDaoImpl();
    var nationMap = await nationDao.fetch(nationId);
    return NationModel.fromJson(nationMap);
  }

  static Future<List<NationModel>> fetchAll(
      {Map<String, dynamic>? body}) async {
    List<NationModel> nations;
    try {
      var nationDao = NationDaoImpl();
      var responseList = await nationDao.fetchAll();
      nations = responseList.map((doc) => NationModel.fromJson(doc)).toList();
    } finally {}
    return nations;
  }

  static Future post(NationModel nation) async {
    var nationDao = NationDaoImpl();
    var nationMap = await nationDao.post(nation.toJson());
    return NationModel.fromJson(nationMap);
  }

  static Future put(NationModel nation, int nationId) async {
    var nationDao = NationDaoImpl();
    var nationMap = await nationDao.put(nation.toJson(), nationId);
    return NationModel.fromJson(nationMap);
  }

  static Future<List<NationModel>> search(String search) async {
    var nationDao = NationDaoImpl();
    var responseList = await nationDao.search(search);
    var nations = responseList.map((doc) => NationModel.fromJson(doc)).toList();
    return nations;
  }

  static Future<List<NationModel>> delete(int nationId) async {
    var nationDao = NationDaoImpl();
    var responseList = await nationDao.delete(nationId);
    var nations = responseList.map((doc) => NationModel.fromJson(doc)).toList();
    return nations;
  }

  static Future<List<NationModel>> deleteMultiple(List<int> nationIds) async {
    var nationDao = NationDaoImpl();
    var responseList = await nationDao.deleteMultiple(nationIds);
    var nations = responseList.map((doc) => NationModel.fromJson(doc)).toList();
    return nations;
  }
}
