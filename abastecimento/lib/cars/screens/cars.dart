import 'package:abastecimento/cars/controllers/veiculo_controller.dart';
import 'package:abastecimento/util/util.dart';

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
      drawerScrimColor: Colors.transparent,
      drawer: DrawerDefault(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: textoPrincipal),
        backgroundColor: fundoPrincipal,
        title: Text(
          'Meus Veículos',
          style: TextStyle(color: textoPrincipal),
        ),
      ),
      body: Container(
        color: fundoPrincipal,
        child: ListView.builder(
          itemCount: controller.veiculos.length,
          itemBuilder: (context, index) {
            final veiculo = controller.veiculos[index];
            final vehicleId = veiculo.id;
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: ListTile(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                tileColor: fundoSecundaria,
                leading: Icon(
                  Icons.directions_car,
                  color: textoPrincipal,
                ),
                title: Text(
                  '${veiculo.nome} - ${veiculo.modelo}',
                  style: TextStyle(color: textoPrincipal),
                ),
                subtitle: Text(
                  'Ano: ${veiculo.ano} | Placa: ${veiculo.placa}',
                  style: TextStyle(color: textoPrincipal),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: textoPrincipal,
                      ),
                      onPressed: () {
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
                      icon: Icon(Icons.delete, color: corErro),
                      onPressed: () async {
                        await controller.deletarVeiculo(vehicleId, context);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: botoesDestaque,
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => NewCar()),
          );
        },
        child: Icon(
          Icons.add,
          color: textoPrincipal,
        ),
        tooltip: 'Adicionar Veículo',
      ),
    );
  }
}
