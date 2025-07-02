import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omniview/data/models/user_model.dart';
import 'package:omniview/data/source/local/user_data.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginRequested>(_onLoginRequested);
  }

  final userSource = UserDataLocalSource();

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    // await Future.delayed(Duration(seconds: 2));
    try {
      print(event.staffId);
      final user = await userSource.getUserByStaffId(event.staffId.trim());
      if (user != null) {
        emit(LoginSuccess(user));
      } else {
        emit(const LoginFailure("Invalid staff ID"));
      }
    } catch (e) {
      emit(LoginFailure("Something went wrong: ${e.toString()}"));
    }
  }
}
