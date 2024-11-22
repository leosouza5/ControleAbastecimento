import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../enum/enum.dart';
import '../controllers/abastecimento_controller.dart';
import '../../util/drawer_default.dart';
import 'novo_abastecimento.dart';

class Abastecimentos extends StatefulWidget {
  const Abastecimentos({super.key});

  @override
  State<Abastecimentos> createState() => _AbastecimentosState();
}

class _AbastecimentosState extends State<Abastecimentos> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AbastecimentoController>().recuperarTodosAbastecimentos();
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AbastecimentoController>();

    return Scaffold(
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
      drawer: DrawerDefault(),
      appBar: AppBar(
        title: Text('Histórico de Abastecimentos'),
      ),
      body: Builder(
        builder: (context) {
          switch (controller.listaAbastecimentosState) {
            case LocalState.loading:
              return Center(child: CircularProgressIndicator());

            case LocalState.sucesso:
              if (controller.abastecimentos.isEmpty) {
                return Center(
                  child: Text(
                    'Nenhum abastecimento registrado.',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                );
              }
              return ListView.builder(
                itemCount: controller.abastecimentos.length,
                itemBuilder: (context, index) {
                  final abastecimento = controller.abastecimentos[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: ListTile(
                      title: Text(
                        'Veículo: ${abastecimento['vehicleName']} - ${abastecimento['vehicleModel']}',
                      ),
                      subtitle: Text(
                        'Data: ${abastecimento['data']}\n'
                        'Litros: ${abastecimento['litros']} | Quilometragem: ${abastecimento['quilometragem']}',
                      ),
                    ),
                  );
                },
              );

            case LocalState.error:
              return Center(
                child: Text(
                  'Erro ao carregar abastecimentos.',
                  style: TextStyle(fontSize: 16, color: Colors.red),
                ),
              );

            case LocalState.idle:
            default:
              return SizedBox.shrink();
          }
        },
      ),
    );
  }
}
