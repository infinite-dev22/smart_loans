import 'package:smart_loans/data_source/daos/implementations/currency_dao_impl.dart';
import 'package:smart_loans/data_source/models/currency_model.dart';

class CurrencyRepo {
  static Future<CurrencyModel> fetch(int currencyId) async {
    var currencyDao = CurrencyDaoImpl();
    var currencyMap = await currencyDao.fetch(currencyId);
    return CurrencyModel.fromJson(currencyMap);
  }

  static Future<List<CurrencyModel>> fetchAll(
      {Map<String, dynamic>? body}) async {
    List<CurrencyModel> currencies;
    try {
      var currencyDao = CurrencyDaoImpl();
      var responseList = await currencyDao.fetchAll();
      currencies =
          responseList.map((doc) => CurrencyModel.fromJson(doc)).toList();
    } finally {}
    return currencies;
  }

  static Future post(CurrencyModel currency) async {
    var currencyDao = CurrencyDaoImpl();
    var currencyMap = await currencyDao.post(currency.toJson());
    return CurrencyModel.fromJson(currencyMap);
  }

  static Future put(CurrencyModel currency, int currencyId) async {
    var currencyDao = CurrencyDaoImpl();
    var currencyMap = await currencyDao.put(currency.toJson(), currencyId);
    return CurrencyModel.fromJson(currencyMap);
  }

  static Future<List<CurrencyModel>> search(String search) async {
    var currencyDao = CurrencyDaoImpl();
    var responseList = await currencyDao.search(search);
    var currencies =
        responseList.map((doc) => CurrencyModel.fromJson(doc)).toList();
    return currencies;
  }

  static Future<List<CurrencyModel>> delete(int currencyId) async {
    var currencyDao = CurrencyDaoImpl();
    var responseList = await currencyDao.delete(currencyId);
    var currencies =
        responseList.map((doc) => CurrencyModel.fromJson(doc)).toList();
    return currencies;
  }

  static Future<List<CurrencyModel>> deleteMultiple(
      List<int> currencyIds) async {
    var currencyDao = CurrencyDaoImpl();
    var responseList = await currencyDao.deleteMultiple(currencyIds);
    var currencies =
        responseList.map((doc) => CurrencyModel.fromJson(doc)).toList();
    return currencies;
  }
}
