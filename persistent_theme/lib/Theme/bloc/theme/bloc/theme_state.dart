part of 'theme_bloc.dart';

sealed class ThemeState extends Equatable {
  const ThemeState();


}

final class ThemeInitial extends ThemeState {
  @override
  List<Object?> get props => [];
}

final class ThemeLoaded extends ThemeState {
  final ThemeData themeData;

  ThemeLoaded({required this.themeData});

  @override
  List<Object?> get props => [themeData];
}

final class PreservedThemeLoaded extends ThemeState {
  final String  name;

  PreservedThemeLoaded({required this.name});

  @override
  List<Object?> get props => [name];
}








