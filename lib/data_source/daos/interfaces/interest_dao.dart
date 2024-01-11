abstract class InterestDao {
  /*
  * Change method return types as per the API End Point response type,
  * If possible modify the API End Points to return as per function that calls to them.
  */

  Future<Map<String, dynamic>> fetch(int id);

  Future<List<dynamic>> fetchAll(int loanId);

  Future<List<Map<String, dynamic>>> search(String search, int loanId);

  Future<dynamic> put(Map<String, dynamic> data, int loanId);

  Future<dynamic> post(Map<String, dynamic> data, int loanId);

  Future<dynamic> delete(int id, int loanId);

  Future<dynamic> deleteMultiple(List<int> ids, int loanId);
}
