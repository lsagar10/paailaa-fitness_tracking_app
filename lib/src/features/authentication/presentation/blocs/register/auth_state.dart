part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class RegisterSuccess extends AuthState {
  final UserModel user;

  const RegisterSuccess({required this.user});

  @override
  List<Object> get props => [user];
}
class LoginSuccess extends AuthState {
  final UserModel user;
  const LoginSuccess({required this.user});
  @override
  List<Object> get props => [user];
}

class OtpVerified extends AuthState {}


class OtpResent extends AuthState {
  // Optional: Add timestamp if needed
  final DateTime timestamp;
  
  OtpResent() : timestamp = DateTime.now();
}

class AuthError extends AuthState {
  final String message;

  const AuthError({required this.message});

  @override
  List<Object> get props => [message];
}