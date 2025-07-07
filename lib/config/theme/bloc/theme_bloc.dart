import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState(ThemeMode.dark)) {
    on<ToggleTheme>((event, emit) {
      emit(
        state.themeMode == ThemeMode.dark
            ? const ThemeState(ThemeMode.light)
            : const ThemeState(ThemeMode.dark),
      );
    });

    on<SetLightTheme>((event, emit) {
      emit(const ThemeState(ThemeMode.light));
    });

    on<SetDarkTheme>((event, emit) {
      emit(const ThemeState(ThemeMode.dark));
    });
  }
}
