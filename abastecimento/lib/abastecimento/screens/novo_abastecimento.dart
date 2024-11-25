import 'package:abastecimento/util/util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../auth/components/input.dart';
import '../../util/drawer_default.dart';
import '../controllers/abastecimento_controller.dart';

class NovoAbastecimento extends StatefulWidget {
  const NovoAbastecimento({super.key});

  @override
  _NovoAbastecimentoState createState() => _NovoAbastecimentoState();
}

class _NovoAbastecimentoState extends State<NovoAbastecimento> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _litrosController = TextEditingController();
  final TextEditingController _quilometragemController = TextEditingController();
  final TextEditingController _dataController = TextEditingController();

  String? _selectedVehicleId;
  List<Map<String, dynamic>> _vehicles = [];

  @override
  void initState() {
    super.initState();
    _loadVehicles();
  }

  Future<void> _loadVehicles() async {
    final controller = context.read<AbastecimentoController>();
    final vehicles = await controller.recuperarVeiculos();
    setState(() {
      _vehicles = vehicles;
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.read<AbastecimentoController>();

    return Scaffold(
      backgroundColor: fundoPrincipal,
      drawerScrimColor: Colors.transparent,
      drawer: DrawerDefault(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: textoPrincipal),
        backgroundColor: fundoPrincipal,
        title: Text(
          'Novo Abastecimento',
          style: TextStyle(color: textoPrincipal),
        ),
      ),
      body: Container(
        color: fundoSecundaria,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: DropdownButtonFormField<String>(
                      value: _selectedVehicleId,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: bordas),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: bordas),
                        ),
                        disabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: bordas),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: bordas),
                        ),
                      ),
                      hint: Text(
                        'Selecione o Veículo',
                        style: TextStyle(color: textoPrincipal),
                      ),
                      items: _vehicles.map<DropdownMenuItem<String>>((vehicle) {
                        return DropdownMenuItem<String>(
                          value: vehicle['id'],
                          child: Text('${vehicle['nome']} - ${vehicle['modelo']}'),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedVehicleId = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, selecione um veículo';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Input(
                    label: Text("Quantidade de Litros"),
                    controller: _litrosController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira a quantidade de litros';
                      }
                      return null;
                    },
                  ),
                  Input(
                    label: Text("Quilometragem Atual"),
                    controller: _quilometragemController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira a quilometragem atual';
                      }
                      return null;
                    },
                  ),
                  Input(
                    label: Text("Data"),
                    hint: 'DD/MM/AAAA',
                    controller: _dataController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira a data do abastecimento';
                      }
                      return null;
                    },
                    onTap: () async {
                      FocusScope.of(context).requestFocus(FocusNode());
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime.now(),
                      );
                      if (pickedDate != null) {
                        _dataController.text = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                      }
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: botoesDestaque),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await controller.registrarAbastecimento(
                          context: context,
                          vehicleId: _selectedVehicleId!,
                          litros: double.parse(_litrosController.text),
                          quilometragem: int.parse(_quilometragemController.text),
                          data: _dataController.text,
                        );
                      }
                    },
                    child: Text(
                      'Registrar Abastecimento',
                      style: TextStyle(color: textoPrincipal),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
