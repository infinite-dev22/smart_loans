import '../daos/implementations/loan_payment_dao_impl.dart';
import '../models/loan_payment_model.dart';

class LoanPaymentRepo {
  static Future<LoanPaymentModel> fetch(int loanPaymentId) async {
    var loanPaymentDao = LoanPaymentDaoImpl();
    var loanPaymentMap = await loanPaymentDao.fetch(loanPaymentId);
    return LoanPaymentModel.fromJson(loanPaymentMap);
  }

  static Future<List<LoanPaymentModel>> fetchAll(int loanPaymentId) async {
    List<LoanPaymentModel> loanPayments;
    try {
      var loanPaymentDao = LoanPaymentDaoImpl();
      var responseList = await loanPaymentDao.fetchAll(loanPaymentId);
      loanPayments =
          responseList.map((doc) => LoanPaymentModel.fromJson(doc)).toList();
    } finally {}
    return loanPayments;
  }

  static Future post(LoanPaymentModel loanPayment) async {
    var loanPaymentDao = LoanPaymentDaoImpl();
    var loanPaymentMap = await loanPaymentDao.post(loanPayment.toJson());
    return LoanPaymentModel.fromJson(loanPaymentMap);
  }

  static Future put(LoanPaymentModel loanPayment, int loanPaymentId) async {
    var loanPaymentDao = LoanPaymentDaoImpl();
    var loanPaymentMap =
        await loanPaymentDao.put(loanPayment.toJson(), loanPaymentId);
    return LoanPaymentModel.fromJson(loanPaymentMap);
  }

  static Future<List<LoanPaymentModel>> search(String search) async {
    var loanPaymentDao = LoanPaymentDaoImpl();
    var responseList = await loanPaymentDao.search(search);
    var loanPayments =
        responseList.map((doc) => LoanPaymentModel.fromJson(doc)).toList();
    return loanPayments;
  }

  static Future<List<LoanPaymentModel>> delete(int loanPaymentId) async {
    var loanPaymentDao = LoanPaymentDaoImpl();
    var responseList = await loanPaymentDao.delete(loanPaymentId);
    var loanPayments =
        responseList.map((doc) => LoanPaymentModel.fromJson(doc)).toList();
    return loanPayments;
  }

  static Future<List<LoanPaymentModel>> deleteMultiple(
      List<int> loanPaymentIds) async {
    var loanPaymentDao = LoanPaymentDaoImpl();
    var responseList = await loanPaymentDao.deleteMultiple(loanPaymentIds);
    var loanPayments =
        responseList.map((doc) => LoanPaymentModel.fromJson(doc)).toList();
    return loanPayments;
  }
}
