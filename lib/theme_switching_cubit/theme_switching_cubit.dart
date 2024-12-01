import 'package:dark_and_light/theme_switching_cubit/theme_switching_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeSwitchingCubit extends Cubit<ThemeSwitchingState> {
  ThemeSwitchingCubit() : super(ThemeSwitchingInitial());
  static ThemeSwitchingCubit get(context) => BlocProvider.of(context);
  bool isDark = false;
  ThemeMode theme = ThemeMode.light;
  void switchTheme() {
    isDark = !isDark;
    theme = isDark? ThemeMode.dark : ThemeMode.light;
    emit(ThemeSwitchingToggle());
  }
}
