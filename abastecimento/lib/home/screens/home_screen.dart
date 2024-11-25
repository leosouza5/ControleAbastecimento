import 'package:abastecimento/util/util.dart';

import '../../util/drawer_default.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerScrimColor: Colors.transparent,
      appBar: AppBar(
        iconTheme: IconThemeData(color: textoPrincipal),
        backgroundColor: fundoPrincipal,
        toolbarHeight: 100,
        centerTitle: true,
        title: Text(
          "Abastecimento",
          style: TextStyle(color: textoPrincipal),
        ),
      ),
      drawer: DrawerDefault(),
      body: Container(
        color: fundoSecundaria,
        child: Center(
          child: Text(
            "Bem vindo !",
            style: TextStyle(fontSize: 28, color: textoSecundario),
          ),
        ),
      ),
    );
  }
}
