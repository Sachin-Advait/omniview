part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object?> get props => [];
}

class UserInitial extends UserState {}

class UserLoaded extends UserState {
  final UserModel user;

  const UserLoaded({required this.user});

  @override
  List<Object?> get props => [user];
}
