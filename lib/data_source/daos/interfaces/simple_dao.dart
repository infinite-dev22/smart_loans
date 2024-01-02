abstract class SimpleDao {
  /*
  * Change method return types as per the API End Point response type,
  * If possible modify the API End Points to return as per function that calls to them.
  */

  Future<Map<String, dynamic>> fetch(int clientId);

  Future<List<Map<String, dynamic>>> fetchAll();

  Future<List<Map<String, dynamic>>> search(String search);

  Future<dynamic> put(Map<String, dynamic> data, int clientId);

  Future<dynamic> post(Map<String, dynamic> data);

  Future<dynamic> delete(int clientId);

  Future<dynamic> deleteMultiple(List<int> clientIds);
}
