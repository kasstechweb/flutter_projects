import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';
import 'package:widgets/components/my_button.dart';
import 'package:widgets/pages/curved_navigation_bar.dart';
import 'package:widgets/pages/home.dart';
import 'package:widgets/pages/light_dark.dart';
import 'package:widgets/pages/riverpod_example.dart';
import 'package:widgets/pages/slidable_widget.dart';
import 'package:widgets/theme/light_dark_theme.dart';
import 'package:widgets/theme/theme_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // var darkMode = ref.watch(darkModeProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/slidable_widget': (context) => const SlidableWidget(),
        '/curved_navigation_bar': (context) => const MyCurvedNavigationBar(),
        '/light_dark': (context) => const LightDark(),
        '/riverpod': (context) => const RiverpodExample(),
      },
      home: const HomePage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
      // ThemeData(
      //   primarySwatch: Colors.grey,
      // ),
      // darkTheme: ThemeData.dark(),
      // themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
    );
  }
}
