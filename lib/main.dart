import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'router/app_router.dart';
import 'viewmodels/user_viewmodel.dart';
import 'viewmodels/github_viewmodel.dart';
import 'viewmodels/theme_viewmodel.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserViewModel()),
        ChangeNotifierProvider(create: (_) => GithubViewModel()),
        ChangeNotifierProvider(create: (_) => ThemeViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = AppRouter().router;
    final themeVm = context.watch<ThemeViewModel>();

    return MaterialApp.router(
      title: 'Resume Builder',
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      themeMode: themeVm.currentThemeMode,
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo, brightness: Brightness.dark),
        useMaterial3: true,
      ),
    );
  }
}
