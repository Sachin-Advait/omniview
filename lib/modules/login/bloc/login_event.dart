part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginRequested extends LoginEvent {
  final String staffId;

  const LoginRequested(this.staffId);

  @override
  List<Object> get props => [staffId];
}
