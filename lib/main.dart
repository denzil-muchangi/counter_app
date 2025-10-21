import 'package:flutter/material.dart';
import 'package:counter_app/core/views/my_homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      theme: _buildLightTheme(),
      darkTheme: _buildDarkTheme(),
      themeMode: ThemeMode.system,
      home: const MyHomePage(title: 'Counter App'),
    );
  }

  // Light theme with monochrome color scheme
  ThemeData _buildLightTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.light(
        // Background colors
        background: Color(0xFFFFFFFF), // White background
        surface: Color(0xFFFFFFFF),
        surfaceContainerHighest: Color(0xFFF5F5F5),

        // Text colors
        onBackground: Color(0xFF000000), // Black text on light background
        onSurface: Color(0xFF000000),

        // Button colors for monochrome scheme
        primary: Color(0xFF4B5563), // Dark gray for increment
        secondary: Color(0xFF6B7280), // Medium gray for decrement
        error: Color(0xFFEF4444), // Red for reset

        // Text colors on buttons
        onPrimary: Color(0xFFFFFFFF), // White text on dark gray
        onSecondary: Color(0xFFFFFFFF), // White text on medium gray
        onError: Color(0xFFFFFFFF), // White text on red

        // App bar colors
        inversePrimary: Color(0xFFF5F5F5),
      ),
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          color: Color(0xFF000000), // Black text for counter display
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Dark theme with monochrome color scheme
  ThemeData _buildDarkTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.dark(
        // Background colors
        background: Color(0xFF18181B), // Dark background
        surface: Color(0xFF18181B),
        surfaceContainerHighest: Color(0xFF2A2A2A),

        // Text colors
        onBackground: Color(0xFFFFFFFF), // White text on dark background
        onSurface: Color(0xFFFFFFFF),

        // Button colors for monochrome scheme (slightly adjusted for dark mode)
        primary: Color(0xFF6B7280), // Medium gray for increment (lighter for dark mode)
        secondary: Color(0xFF4B5563), // Dark gray for decrement (darker for dark mode)
        error: Color(0xFFEF4444), // Red for reset (same as light mode)

        // Text colors on buttons
        onPrimary: Color(0xFFFFFFFF), // White text on gray
        onSecondary: Color(0xFFFFFFFF), // White text on gray
        onError: Color(0xFFFFFFFF), // White text on red

        // App bar colors
        inversePrimary: Color(0xFF2A2A2A),
      ),
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          color: Color(0xFFFFFFFF), // White text for counter display in dark mode
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}