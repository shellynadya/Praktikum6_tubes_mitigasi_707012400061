import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  // Tema awal menggunakan Light Mode
  ThemeCubit() : super(ThemeMode.light);

  // Mengganti Light Mode dan Dark Mode
  void toggle() {
    emit(
      state == ThemeMode.dark
          ? ThemeMode.light
          : ThemeMode.dark,
    );
  }

  // Mengubah tema melalui Switch
  void ubahTema(bool modeGelap) {
    emit(
      modeGelap
          ? ThemeMode.dark
          : ThemeMode.light,
    );
  }
}
