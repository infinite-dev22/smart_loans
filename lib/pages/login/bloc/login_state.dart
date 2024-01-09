part of 'login_bloc.dart';

enum LogInStatus {
  initial,
  success,
  successfullyLoggedIn,
  error,
  loading,
  selected,
  noData
}

extension LogInStatusX on LogInStatus {
  bool get isInitial => this == LogInStatus.initial;

  bool get isSuccess => this == LogInStatus.success;

  bool get isSuccessfullyLoggedIn => this == LogInStatus.success;

  bool get isError => this == LogInStatus.error;

  bool get isLoading => this == LogInStatus.loading;

  bool get isSelected => this == LogInStatus.selected;
}

@immutable
class LogInState extends Equatable {
  final UserModel? user;
  final LogInStatus status;
  final bool? rememberUser;

  const LogInState({
    this.user,
    this.rememberUser = false,
    this.status = LogInStatus.initial,
  });

  @override
  List<Object?> get props => [user, rememberUser, status];

  // Copy state.
  LogInState copyWith({
    UserModel? user,
    bool? rememberUser,
    LogInStatus? status,
  }) {
    return LogInState(
      user: user ?? this.user,
      rememberUser: rememberUser ?? this.rememberUser,
      status: status ?? this.status,
    );
  }
}

class LogInRememberUser extends LogInState {}

class LogInInitial extends LogInState {}

class LogInLoading extends LogInState {}

class LogInSuccess extends LogInState {
  const LogInSuccess(user);

  @override
  List<Object?> get props => [user];
}

class AuthUser extends LogInState {}

class LogInError extends LogInState {}
