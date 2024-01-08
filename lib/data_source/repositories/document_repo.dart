import 'package:smart_loans/data_source/daos/implementations/document_dao_impl.dart';
import 'package:smart_loans/data_source/models/document_model.dart';

class DocumentRepo {
  static Future<DocumentModel> fetch(int clientId) async {
    var clientDao = DocumentDaoImpl();
    var clientMap = await clientDao.fetch(clientId);
    return DocumentModel.fromJson(clientMap);
  }

  static Future<List<DocumentModel>> fetchAll(
      {Map<String, dynamic>? body}) async {
    List<DocumentModel> clients;
    try {
      var clientDao = DocumentDaoImpl();
      var responseList = await clientDao.fetchAll();
      clients = responseList.map((doc) => DocumentModel.fromJson(doc)).toList();
    } finally {}
    return clients;
  }

  static Future post(DocumentModel client) async {
    var clientDao = DocumentDaoImpl();
    var clientMap = await clientDao.post(client.toJson());
    return DocumentModel.fromJson(clientMap);
  }

  static Future put(DocumentModel client, int clientId) async {
    var clientDao = DocumentDaoImpl();
    var clientMap = await clientDao.put(client.toJson(), clientId);
    return DocumentModel.fromJson(clientMap);
  }

  static Future<List<DocumentModel>> search(String search) async {
    var clientDao = DocumentDaoImpl();
    var responseList = await clientDao.search(search);
    var clients =
        responseList.map((doc) => DocumentModel.fromJson(doc)).toList();
    return clients;
  }

  static Future<List<DocumentModel>> delete(int clientId) async {
    var clientDao = DocumentDaoImpl();
    var responseList = await clientDao.delete(clientId);
    var clients =
        responseList.map((doc) => DocumentModel.fromJson(doc)).toList();
    return clients;
  }

  static Future<List<DocumentModel>> deleteMultiple(List<int> clientIds) async {
    var clientDao = DocumentDaoImpl();
    var responseList = await clientDao.deleteMultiple(clientIds);
    var clients =
        responseList.map((doc) => DocumentModel.fromJson(doc)).toList();
    return clients;
  }
}
