import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_and_register_pages/firebase_options.dart';
import 'package:login_and_register_pages/logic/theme/theme_cuibt.dart';
import 'package:login_and_register_pages/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (context) => ThemeCuibt())],
      child: const MyApp(),
    ),
  );
}
