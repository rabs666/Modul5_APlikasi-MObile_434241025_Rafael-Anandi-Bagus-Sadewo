import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'features/dashboard/presentation/pages/dashboard_page.dart';
import 'core/theme/app_theme.dart';

void main() {
  runApp(
    // ProviderScope diperlukan agar Riverpod bisa berjalan
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard Admin D4TI',
      debugShowCheckedModeBanner: false,
      // Menggunakan tema yang sudah kita buat di core
      theme: AppTheme.lightTheme,
      // Langsung arahkan ke DashboardPage milik fitur (foto ke-2)
      home: const DashboardPage(),
    );
  }
}
