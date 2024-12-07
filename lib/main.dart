import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_and_register_pages/logic/theme_cuibt/theme_cuibt.dart';
import 'package:login_and_register_pages/theme/app_theme.dart';

void main() {
  runApp(MultiBlocProvider(
      providers: [BlocProvider(create: (context) => ThemeCuibt())],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      builder: (context, state) {
        return MaterialApp(
          theme: AppTheme().lightMode,
          darkTheme: AppTheme().darkMode,
          themeMode:
              state == ThemeStatus.light ? ThemeMode.dark : ThemeMode.light,
        );
      },
    );
  }
}
