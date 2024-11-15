import 'package:abastecimento/lib/abastecimento/screens/abastecimentos.dart';
import 'package:abastecimento/lib/cars/screens/cars.dart';
import 'package:abastecimento/lib/cars/screens/new_car.dart';
import 'package:flutter/material.dart';

class DrawerDefault extends StatelessWidget {
  const DrawerDefault({super.key});

  @override
  Drawer build(BuildContext context) {
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
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
