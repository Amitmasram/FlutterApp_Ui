part of 'theme_bloc.dart';

sealed class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class ChangeThemeEvent extends ThemeEvent {
  final String name;
  const ChangeThemeEvent({required this.name});

  @override
  List<Object?> get props => [name];
}

class GetPreservedThemeEvent extends ThemeEvent {
  const GetPreservedThemeEvent();

  @override
  List<Object?> get props => [];
}

class GetPreservedThemeLoadEvent extends ThemeEvent {
  final String name;
  GetPreservedThemeLoadEvent(this.name);

  @override
  List<Object?> get props => [name];
}
