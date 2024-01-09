import 'package:smart_loans/data_source/daos/implementations/client_type_dao_impl.dart';
import 'package:smart_loans/data_source/models/client_type_model.dart';

class ClientTypeRepo {
  static Future<ClientTypeModel> fetch(int clientTypeId) async {
    var clientTypeDao = ClientTypeDaoImpl();
    var clientTypeMap = await clientTypeDao.fetch(clientTypeId);
    return ClientTypeModel.fromJson(clientTypeMap);
  }

  static Future<List<ClientTypeModel>> fetchAll(
      {Map<String, dynamic>? body}) async {
    List<ClientTypeModel> clientTypes;
    try {
      var clientTypeDao = ClientTypeDaoImpl();
      var responseList = await clientTypeDao.fetchAll();
      clientTypes =
          responseList.map((doc) => ClientTypeModel.fromJson(doc)).toList();
    } finally {}
    return clientTypes;
  }

  static Future post(ClientTypeModel clientType) async {
    var clientTypeDao = ClientTypeDaoImpl();
    var clientTypeMap = await clientTypeDao.post(clientType.toJson());
    return ClientTypeModel.fromJson(clientTypeMap);
  }

  static Future put(ClientTypeModel clientType, int clientTypeId) async {
    var clientTypeDao = ClientTypeDaoImpl();
    var clientTypeMap =
        await clientTypeDao.put(clientType.toJson(), clientTypeId);
    return ClientTypeModel.fromJson(clientTypeMap);
  }

  static Future<List<ClientTypeModel>> search(String search) async {
    var clientTypeDao = ClientTypeDaoImpl();
    var responseList = await clientTypeDao.search(search);
    var clientTypes =
        responseList.map((doc) => ClientTypeModel.fromJson(doc)).toList();
    return clientTypes;
  }

  static Future<List<ClientTypeModel>> delete(int clientTypeId) async {
    var clientTypeDao = ClientTypeDaoImpl();
    var responseList = await clientTypeDao.delete(clientTypeId);
    var clientTypes =
        responseList.map((doc) => ClientTypeModel.fromJson(doc)).toList();
    return clientTypes;
  }

  static Future<List<ClientTypeModel>> deleteMultiple(
      List<int> clientTypeIds) async {
    var clientTypeDao = ClientTypeDaoImpl();
    var responseList = await clientTypeDao.deleteMultiple(clientTypeIds);
    var clientTypes =
        responseList.map((doc) => ClientTypeModel.fromJson(doc)).toList();
    return clientTypes;
  }
}
