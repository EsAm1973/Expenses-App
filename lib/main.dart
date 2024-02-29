import 'package:flutter/material.dart';
import 'package:personal_expenses/expenses.dart';

void main() {
  runApp(const MyApp());
}
var MyColorScheme=ColorScheme.fromSeed(seedColor: Colors.blue);
var MyDarkColorScheme=ColorScheme.fromSeed(seedColor: Colors.blue);
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expenses App',
      themeMode: ThemeMode.light,
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: MyColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: MyColorScheme.onPrimaryContainer,
          foregroundColor: MyColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: MyColorScheme.secondaryContainer,
          margin: const EdgeInsets.all(5),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: MyColorScheme.primaryContainer,
          )
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: MyColorScheme.onSecondaryContainer,
            fontSize: 17,
          )
        )
      ),

      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: MyDarkColorScheme,
        
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: MyDarkColorScheme.onPrimaryContainer,
          foregroundColor: MyDarkColorScheme.primaryContainer,
        ),
        bottomSheetTheme: BottomSheetThemeData().copyWith(
          backgroundColor: MyDarkColorScheme.onPrimaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: MyDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.all(5),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: MyDarkColorScheme.primaryContainer,
            foregroundColor: MyDarkColorScheme.onPrimaryContainer,
          )
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: MyDarkColorScheme.onSecondaryContainer,
            fontSize: 17,
          )
        )
      ),
      home: const Expenses(),
    );
  }
}
