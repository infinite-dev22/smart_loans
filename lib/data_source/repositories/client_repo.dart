import 'package:smart_loans/data_source/daos/implementations/client_dao_impl.dart';
import 'package:smart_loans/data_source/models/client_model.dart';

class ClientRepo {
  static Future<ClientModel> fetch(int clientId) async {
    var clientDao = ClientDaoImpl();
    var clientMap = await clientDao.fetch(clientId);
    return ClientModel.fromJson(clientMap);
  }

  static Future<List<ClientModel>> fetchAll(
      {Map<String, dynamic>? body}) async {
    List<ClientModel> clients;
    try {
      var clientDao = ClientDaoImpl();
      var responseList = await clientDao.fetchAll();
      clients = responseList.map((doc) => ClientModel.fromJson(doc)).toList();
    } finally {}
    return clients;
  }

  static Future post(ClientModel client) async {
    var clientDao = ClientDaoImpl();
    var clientMap = await clientDao.post(client.toJson());
    return ClientModel.fromJson(clientMap);
  }

  static Future put(ClientModel client, int clientId) async {
    var clientDao = ClientDaoImpl();
    var clientMap = await clientDao.put(client.toJson(), clientId);
    return ClientModel.fromJson(clientMap);
  }

  static Future<List<ClientModel>> search(String search) async {
    var clientDao = ClientDaoImpl();
    var responseList = await clientDao.search(search);
    var clients = responseList.map((doc) => ClientModel.fromJson(doc)).toList();
    return clients;
  }

  static Future<List<ClientModel>> delete(int clientId) async {
    var clientDao = ClientDaoImpl();
    var responseList = await clientDao.delete(clientId);
    var clients = responseList.map((doc) => ClientModel.fromJson(doc)).toList();
    return clients;
  }

  static Future<List<ClientModel>> deleteMultiple(List<int> clientIds) async {
    var clientDao = ClientDaoImpl();
    var responseList = await clientDao.deleteMultiple(clientIds);
    var clients = responseList.map((doc) => ClientModel.fromJson(doc)).toList();
    return clients;
  }
}
