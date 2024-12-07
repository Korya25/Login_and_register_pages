import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_and_register_pages/logic/theme_cuibt/theme_cuibt.dart';
import 'package:login_and_register_pages/my_app.dart';

void main() {
  runApp(MultiBlocProvider(
      providers: [BlocProvider(create: (context) => ThemeCuibt())],
      child: const MyApp()));
}
