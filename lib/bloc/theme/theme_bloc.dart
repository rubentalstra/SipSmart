import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:sip_smart/core/themes/themes.dart';
import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(themeData: AppThemes.lightTheme)) {
    on<ToggleThemeEvent>((event, emit) {
      // Toggle between light and dark theme
      if (state.themeData.brightness == Brightness.light) {
        emit(ThemeState(themeData: AppThemes.darkTheme));
      } else {
        emit(ThemeState(themeData: AppThemes.lightTheme));
      }
    });
  }
}
