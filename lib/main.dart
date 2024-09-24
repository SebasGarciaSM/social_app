import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:social_app/helpers/custom_colors.dart';
import 'package:social_app/modules/app_modules.dart';

void main() {
  runApp(
    ModularApp(
      module: AppModule(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: Modular.routerConfig,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: CustomColors.lightGrey,
      ),
    );
  }
}
