part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final ThemeMode themeMode;

  const ThemeState(this.themeMode);

  bool get isDark => themeMode == ThemeMode.dark;

  @override
  List<Object?> get props => [themeMode];

  @override
  String toString() => 'ThemeState(themeMode: $themeMode)';
}
