import 'package:smart_loans/data_source/daos/implementations/client_dao_impl.dart';
import 'package:smart_loans/data_source/models/client_model.dart';

class ClientRepo {
  static Future<ClientModel> fetch(int clientId) async {
    var clientRepo = ClientDaoImpl();
    var clientMap = await clientRepo.fetch(clientId);
    return ClientModel.fromJson(clientMap);
  }

  static Future<List<ClientModel>> fetchAll({Map<String, dynamic>? body}) async {
    var clientRepo = ClientDaoImpl();
    var responseList = await clientRepo.fetchAll();
    var clients = responseList.map((doc) => ClientModel.fromJson(doc)).toList();
    return clients;
  }

  static Future post(ClientModel client) async {
    var clientRepo = ClientDaoImpl();
    var clientMap = await clientRepo.post(client.toJson());
    return ClientModel.fromJson(clientMap);
  }

  static Future put(ClientModel client, int clientId) async {
    var clientRepo = ClientDaoImpl();
    var clientMap = await clientRepo.put(client.toJson(), clientId);
    return ClientModel.fromJson(clientMap);
  }

  static Future<List<ClientModel>> search(String search) async {
    var clientRepo = ClientDaoImpl();
    var responseList = await clientRepo.search(search);
    var clients = responseList.map((doc) => ClientModel.fromJson(doc)).toList();
    return clients;
  }

  static Future<List<ClientModel>> delete(int clientId) async {
    var clientRepo = ClientDaoImpl();
    var responseList = await clientRepo.delete(clientId);
    var clients = responseList.map((doc) => ClientModel.fromJson(doc)).toList();
    return clients;
  }

  static Future<List<ClientModel>> deleteMultiple(List<int> clientIds) async {
    var clientRepo = ClientDaoImpl();
    var responseList = await clientRepo.deleteMultiple(clientIds);
    var clients = responseList.map((doc) => ClientModel.fromJson(doc)).toList();
    return clients;
  }
}
