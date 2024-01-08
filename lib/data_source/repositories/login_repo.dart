import 'package:smart_loans/data_source/daos/implementations/login_dao_impl.dart';
import 'package:smart_loans/data_source/models/login_model.dart';
import 'package:smart_loans/data_source/models/user_model.dart';

class LoginRepo {
  static Future loginUser(LogInModel login) async {
    var loginDao = LoginDaoImpl();
    var userMap = await loginDao.post(login.toJson());
    return UserModel.fromJson(userMap);
  }
}
