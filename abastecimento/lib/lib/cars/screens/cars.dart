import 'package:abastecimento/lib/cars/screens/new_car.dart';
import 'package:abastecimento/lib/util/drawer_default.dart';
import 'package:flutter/material.dart';

class Cars extends StatelessWidget {
  Cars({super.key});
  final List<Map<String, String>> veiculos = [
    {'nome': 'Carro 1', 'modelo': 'Modelo A', 'ano': '2020', 'placa': 'ABC1234'},
    {'nome': 'Carro 2', 'modelo': 'Modelo B', 'ano': '2021', 'placa': 'DEF5678'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerDefault(),
      appBar: AppBar(
        title: Text('Meus Veículos'),
      ),
      body: ListView.builder(
        itemCount: veiculos.length,
        itemBuilder: (context, index) {
          final veiculo = veiculos[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: ListTile(
              leading: Icon(Icons.directions_car),
              title: Text('${veiculo['nome']} - ${veiculo['modelo']}'),
              subtitle: Text('Ano: ${veiculo['ano']} | Placa: ${veiculo['placa']}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      icon: Icon(Icons.remove_red_eye),
                      onPressed: () {
                        // Implementar lógica de exclusão
                      }),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      // Implementar lógica de exclusão
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => NewCar()),
          );
        },
        child: Icon(Icons.add),
        tooltip: 'Adicionar Veículo',
      ),
    );
  }
}
