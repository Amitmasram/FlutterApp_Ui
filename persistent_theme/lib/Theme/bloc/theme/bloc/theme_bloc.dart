import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:persistent_theme/Theme/local/shared_preference.dart';
import 'package:persistent_theme/Theme/preferences/theme_preferences.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial()) {
    on<ChangeThemeEvent>((event, emit) {
      SharedPref.setThemeID(value: event.name);
      emit(ThemeLoaded(themeData: appThemeData[event.name]!));
    });
    on<GetPreservedThemeEvent>((event, emit) {
      SharedPref.getThemeID().then((value) {
        add(
          GetPreservedThemeLoadEvent(value),
        );
      });
    });
    on<GetPreservedThemeLoadEvent>((event, emit) {
      emit(PreservedThemeLoaded(name: event.name));
    });
  }
}
