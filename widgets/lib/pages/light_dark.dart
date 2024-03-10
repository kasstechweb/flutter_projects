import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';
import 'package:widgets/components/dark_light_button.dart';
import 'package:widgets/components/light_dark_box.dart';
import 'package:widgets/theme/theme_provider.dart';

class LightDark extends StatelessWidget {
  const LightDark({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: LightDarkBox(
          color: Theme.of(context).colorScheme.primary,
          child: LightDarkButton(
            onTap: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}
