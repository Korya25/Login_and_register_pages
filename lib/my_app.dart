import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_and_register_pages/logic/theme/theme_cuibt.dart';
import 'package:login_and_register_pages/theme/app_theme.dart';
import 'package:login_and_register_pages/views/screens/auth/login.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCuibt, ThemeStatus>(
      builder: (context, state) {
        return MaterialApp(
          // Theme
          theme: AppTheme().lightMode,
          darkTheme: AppTheme().darkMode,
          themeMode:
              state == ThemeStatus.light ? ThemeMode.dark : ThemeMode.light,

          // Matrial Body
          home: Login(),
        );
      },
    );
  }
}
