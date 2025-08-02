part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class RegisterEvent extends AuthEvent {
  final UserModel user;

  const RegisterEvent({required this.user});

  @override
  List<Object> get props => [user];
}

class LoginEvent extends AuthEvent {
  final UserModel user;
  const LoginEvent({required this.user});
  @override
  List<Object> get props => [user];
}
class VerifyOtpEvent extends AuthEvent {
  final OtpModel otp;

  const VerifyOtpEvent({required this.otp});

  @override
  List<Object> get props => [otp];
}

class ResendOtpEvent extends AuthEvent {
  final String email;

  const ResendOtpEvent({required this.email});

  @override
  List<Object> get props => [email];
}