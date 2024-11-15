import 'package:abastecimento/lib/auth/pages/auth_screen.dart';
import 'package:abastecimento/lib/util/theme.dart';
import 'package:abastecimento/lib/util/util.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, "Poppins", "Poppins");
    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme.light(),
      home: const AuthScreen(),
    );
  }
}
