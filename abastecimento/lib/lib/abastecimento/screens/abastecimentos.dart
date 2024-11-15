import 'package:abastecimento/lib/abastecimento/screens/novo_abastecimento.dart';
import 'package:abastecimento/lib/util/drawer_default.dart';
import 'package:flutter/material.dart';

class Abastecimentos extends StatelessWidget {
  final List<Map<String, dynamic>> abastecimentos = [
    {'litros': 50.0, 'quilometragem': 12345, 'data': '01/11/2024'},
    {'litros': 40.0, 'quilometragem': 12500, 'data': '10/11/2024'},
  ];

  Abastecimentos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerDefault(),
      appBar: AppBar(
        title: Text('Histórico de Abastecimentos'),
      ),
      body: abastecimentos.isEmpty
          ? Center(
              child: Text(
                'Nenhum abastecimento registrado.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: abastecimentos.length,
              itemBuilder: (context, index) {
                final abastecimento = abastecimentos[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: ListTile(
                    title: Text('Data: ${abastecimento['data']}'),
                    subtitle: Text(
                      'Litros: ${abastecimento['litros']} | Quilometragem: ${abastecimento['quilometragem']}',
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        // Implementar lógica de exclusão
                      },
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => NovoAbastecimento()),
          );
        },
        child: Icon(Icons.add),
        tooltip: 'Novo Abastecimento',
      ),
    );
  }
}
