import 'package:abastecimento/auth/pages/auth_screen.dart';
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
    final user = FirebaseAuth.instance.currentUser; // Obtem o usuário autenticado
    final email = user?.email ?? 'Usuário não identificado'; // Obtem o email ou uma mensagem padrão

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.account_circle, size: 64, color: Colors.white),
                SizedBox(height: 8),
                Text(
                  'Bem-vindo!',
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  email, // Exibe o email do usuário
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: Theme.of(context).primaryColor),
            title: Text('Home'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.directions_car, color: Theme.of(context).primaryColor),
            title: Text('Meus Veículos'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Cars(),
                  ));
            },
          ),
          ListTile(
            leading: Icon(Icons.add_circle, color: Theme.of(context).primaryColor),
            title: Text('Adicionar Veículo'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewCar(),
                  ));
            },
          ),
          ListTile(
            leading: Icon(Icons.history, color: Theme.of(context).primaryColor),
            title: Text('Histórico de Abastecimentos'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (contex) => Abastecimentos(),
                  ));
            },
          ),
          ListTile(
            leading: Icon(Icons.person, color: Theme.of(context).primaryColor),
            title: Text('Perfil'),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout, color: Theme.of(context).primaryColor),
            title: Text('Sair'),
            onTap: () {
              logout(context);
            },
          ),
        ],
      ),
    );
  }
}
