import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:smart_loans/data_source/models/login_model.dart';
import 'package:smart_loans/data_source/models/user_model.dart';
import 'package:smart_loans/data_source/repositories/login_repo.dart';
import 'package:smart_loans/global_values.dart';
import 'package:smart_loans/init.dart';

part 'login_event.dart';
part 'login_state.dart';

class LogInBloc extends Bloc<LoginEvent, LogInState> {
  LogInBloc() : super(const LogInState()) {
    on<LogInUser>(_mapLoginUserEventToState);
    on<RememberUser>(_mapRememberUserEventToState);
  }

  _mapLoginUserEventToState(LogInUser event, Emitter<LogInState> emit) async {
    emit(state.copyWith(status: LogInStatus.loading));
    var login = LogInModel(email: event.email, password: event.password);
    await LoginRepo.loginUser(login).then((user) {
      currentUser = user;
      var prefs = getLocalStorage();
      if (currentUser.token != null) {
        prefs.write("authToken", currentUser.token!);
      }
      emit(
          state.copyWith(status: LogInStatus.successfullyLoggedIn, user: user));
    }).onError((error, stackTrace) {
      emit(state.copyWith(status: LogInStatus.error));
    });
  }

  _mapRememberUserEventToState(
      RememberUser event, Emitter<LogInState> emit) async {
    emit(state.copyWith(status: LogInStatus.loading));
    var rememberUser = event.rememberUser;
    emit(state.copyWith(
        status: LogInStatus.success, rememberUser: rememberUser));
  }
}
