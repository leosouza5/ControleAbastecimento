import 'package:abastecimento/auth/pages/auth_screen.dart';
import 'package:abastecimento/home/screens/home_screen.dart';
import 'package:abastecimento/util/util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../abastecimento/screens/abastecimentos.dart';
import '../cars/screens/cars.dart';
import '../cars/screens/new_car.dart';

class DrawerDefault extends StatelessWidget {
  const DrawerDefault({super.key});

  Future<void> logout(BuildContext context) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    try {
      await _auth.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AuthScreen()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao fazer logout: $e')),
      );
    }
  }

  @override
  Drawer build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final email = user?.email ?? 'Usuário não identificado';

    return Drawer(
      backgroundColor: fundoPrincipal,
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: fundoSecundaria,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.account_circle, size: 64, color: textoPrincipal),
                SizedBox(height: 8),
                Text(
                  'Bem-vindo!',
                  style: TextStyle(color: textoPrincipal, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  email,
                  style: TextStyle(color: textoPrincipal, fontSize: 14),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: textoPrincipal),
            title: Text(
              'Home',
              style: TextStyle(color: textoSecundario),
            ),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ));
            },
          ),
          ListTile(
            leading: Icon(Icons.directions_car, color: textoPrincipal),
            title: Text(
              'Meus Veículos',
              style: TextStyle(color: textoSecundario),
            ),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Cars(),
                  ));
            },
          ),
          ListTile(
            leading: Icon(Icons.add_circle, color: textoPrincipal),
            title: Text(
              'Adicionar Veículo',
              style: TextStyle(color: textoSecundario),
            ),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewCar(),
                  ));
            },
          ),
          ListTile(
            leading: Icon(Icons.history, color: textoPrincipal),
            title: Text(
              'Histórico de Abastecimentos',
              style: TextStyle(color: textoSecundario),
            ),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (contex) => Abastecimentos(),
                  ));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout, color: textoPrincipal),
            title: Text(
              'Sair',
              style: TextStyle(color: textoSecundario),
            ),
            onTap: () {
              logout(context);
            },
          ),
        ],
      ),
    );
  }
}
