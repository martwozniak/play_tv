import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:play_tv/config/dependency_injection.dart';
import 'package:play_tv/config/app_router.dart';
import 'package:play_tv/config/app_theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: DependencyInjection.providers,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Play TV',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routes: AppRouter.routes,
    );
  }
}
