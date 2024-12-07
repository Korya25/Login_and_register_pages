// status
import 'package:flutter_bloc/flutter_bloc.dart';

enum ThemeStatus { light, dark }

// Cuibt
class ThemeCuibt extends Cubit<ThemeStatus> {
  ThemeCuibt() : super(ThemeStatus.light);

  // Create Toggle Theme Method
  void toggleTheme() {
    emit(state == ThemeStatus.light ? ThemeStatus.dark : ThemeStatus.light);
  }
}
