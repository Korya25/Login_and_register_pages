import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_and_register_pages/logic/theme_cuibt/theme_cuibt.dart';

class ThemeModeButton extends StatelessWidget {
  const ThemeModeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCuibt, ThemeStatus>(
      builder: (context, state) {
        return IconButton(
          onPressed: BlocProvider.of<ThemeCuibt>(context).toggleTheme,
          icon: Icon(
            state == ThemeStatus.light ? Icons.dark_mode : Icons.light_mode,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        );
      },
    );
  }
}
