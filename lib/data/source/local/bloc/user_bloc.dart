import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omniview/data/models/user_model.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<SetUserEvent>((event, emit) {
      emit(UserLoaded(user: event.user));
    });

    on<ClearUserEvent>((event, emit) {
      emit(UserInitial());
    });
  }
}
