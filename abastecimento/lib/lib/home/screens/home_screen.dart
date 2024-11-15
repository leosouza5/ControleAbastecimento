import 'package:abastecimento/lib/util/drawer_default.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        title: Text("Abastecimento"),
      ),
      drawer: DrawerDefault(),
      body: Center(
        child: Text(
          "Bem vindo !",
          style: TextStyle(fontSize: 28),
        ),
      ),
    );
  }
}
