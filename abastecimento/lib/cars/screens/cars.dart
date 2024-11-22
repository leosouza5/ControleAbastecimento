import 'package:abastecimento/cars/controllers/veiculo_controller.dart';

import 'new_car.dart';
import '../../util/drawer_default.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cars extends StatefulWidget {
  const Cars({super.key});

  @override
  State<Cars> createState() => _CarsState();
}

class _CarsState extends State<Cars> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => context.read<VeiculoController>().recuperaVeiculos(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<VeiculoController>();
    return Scaffold(
      drawer: DrawerDefault(),
      appBar: AppBar(
        title: Text('Meus Veículos'),
      ),
      body: ListView.builder(
        itemCount: controller.veiculos.length,
        itemBuilder: (context, index) {
          final veiculo = controller.veiculos[index];
          final vehicleId = veiculo.id; // Certifique-se de incluir o ID nos dados do veículo
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: ListTile(
              leading: Icon(Icons.directions_car),
              title: Text('${veiculo.nome} - ${veiculo.modelo}'),
              subtitle: Text('Ano: ${veiculo.ano} | Placa: ${veiculo.placa}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      // Navega para a tela de edição com os dados do veículo
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewCar(
                            veiculo: veiculo,
                            vehicleId: vehicleId,
                          ),
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () async {
                      // Chama o método de exclusão
                      await controller.deletarVeiculo(vehicleId, context);
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
