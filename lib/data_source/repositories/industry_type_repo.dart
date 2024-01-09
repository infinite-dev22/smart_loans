import 'package:smart_loans/data_source/daos/implementations/industry_type_dao_impl.dart';
import 'package:smart_loans/data_source/models/industry_type.dart';

class IndustryTypeRepo {
  static Future<IndustryTypeModel> fetch(int clientTypeId) async {
    var clientTypeDao = IndustryTypeDaoImpl();
    var clientTypeMap = await clientTypeDao.fetch(clientTypeId);
    return IndustryTypeModel.fromJson(clientTypeMap);
  }

  static Future<List<IndustryTypeModel>> fetchAll(
      {Map<String, dynamic>? body}) async {
    List<IndustryTypeModel> industryTypes;
    try {
      var clientTypeDao = IndustryTypeDaoImpl();
      var responseList = await clientTypeDao.fetchAll();
      industryTypes =
          responseList.map((doc) => IndustryTypeModel.fromJson(doc)).toList();
    } finally {}
    return industryTypes;
  }

  static Future post(IndustryTypeModel clientType) async {
    var clientTypeDao = IndustryTypeDaoImpl();
    var clientTypeMap = await clientTypeDao.post(clientType.toJson());
    return IndustryTypeModel.fromJson(clientTypeMap);
  }

  static Future put(IndustryTypeModel clientType, int clientTypeId) async {
    var clientTypeDao = IndustryTypeDaoImpl();
    var clientTypeMap =
        await clientTypeDao.put(clientType.toJson(), clientTypeId);
    return IndustryTypeModel.fromJson(clientTypeMap);
  }

  static Future<List<IndustryTypeModel>> search(String search) async {
    var clientTypeDao = IndustryTypeDaoImpl();
    var responseList = await clientTypeDao.search(search);
    var industryTypes =
        responseList.map((doc) => IndustryTypeModel.fromJson(doc)).toList();
    return industryTypes;
  }

  static Future<List<IndustryTypeModel>> delete(int clientTypeId) async {
    var clientTypeDao = IndustryTypeDaoImpl();
    var responseList = await clientTypeDao.delete(clientTypeId);
    var industryTypes =
        responseList.map((doc) => IndustryTypeModel.fromJson(doc)).toList();
    return industryTypes;
  }

  static Future<List<IndustryTypeModel>> deleteMultiple(
      List<int> clientTypeIds) async {
    var clientTypeDao = IndustryTypeDaoImpl();
    var responseList = await clientTypeDao.deleteMultiple(clientTypeIds);
    var industryTypes =
        responseList.map((doc) => IndustryTypeModel.fromJson(doc)).toList();
    return industryTypes;
  }
}
