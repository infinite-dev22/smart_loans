import 'package:smart_loans/data_source/daos/implementations/client_dao_impl.dart';
import 'package:smart_loans/data_source/daos/implementations/role_dao_impl.dart';
import 'package:smart_loans/data_source/models/client_model.dart';
import 'package:smart_loans/data_source/models/role_model.dart';

class RoleRepo {
  static Future<RoleModel> fetch(int clientId) async {
    var clientDao = RoleDaoImpl();
    var clientMap = await clientDao.fetch(clientId);
    return RoleModel.fromJson(clientMap);
  }

  static Future<List<RoleModel>> fetchAll(
      {Map<String, dynamic>? body}) async {
    List<RoleModel> clients;
    try {
      var clientDao = RoleDaoImpl();
      var responseList = await clientDao.fetchAll();
      clients = responseList.map((doc) => RoleModel.fromJson(doc)).toList();
    } finally {}
    return clients;
  }

  static Future post(RoleModel client) async {
    var clientDao = RoleDaoImpl();
    var clientMap = await clientDao.post(client.toJson());
    return RoleModel.fromJson(clientMap);
  }

  static Future put(RoleModel client, int clientId) async {
    var clientDao = RoleDaoImpl();
    var clientMap = await clientDao.put(client.toJson(), clientId);
    return RoleModel.fromJson(clientMap);
  }

  static Future<List<RoleModel>> search(String search) async {
    var clientDao = RoleDaoImpl();
    var responseList = await clientDao.search(search);
    var clients = responseList.map((doc) => RoleModel.fromJson(doc)).toList();
    return clients;
  }

  static Future<List<RoleModel>> delete(int clientId) async {
    var clientDao = RoleDaoImpl();
    var responseList = await clientDao.delete(clientId);
    var clients = responseList.map((doc) => RoleModel.fromJson(doc)).toList();
    return clients;
  }

  static Future<List<RoleModel>> deleteMultiple(List<int> clientIds) async {
    var clientDao = RoleDaoImpl();
    var responseList = await clientDao.deleteMultiple(clientIds);
    var clients = responseList.map((doc) => RoleModel.fromJson(doc)).toList();
    return clients;
  }
}
