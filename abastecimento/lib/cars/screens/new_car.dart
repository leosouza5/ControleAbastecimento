import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../auth/components/input.dart';
import '../controllers/veiculo_controller.dart';
import '../../models/veiculo.dart';

class NewCar extends StatefulWidget {
  final Veiculo? veiculo;
  final String? vehicleId;

  NewCar({super.key, this.veiculo, this.vehicleId});

  @override
  State<NewCar> createState() => _NewCarState();
}

class _NewCarState extends State<NewCar> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _modeloController = TextEditingController();
  final TextEditingController _anoController = TextEditingController();
  final TextEditingController _placaController = TextEditingController();

  String? mediaConsumo;

  @override
  void initState() {
    super.initState();

    if (widget.veiculo != null) {
      _nomeController.text = widget.veiculo!.nome;
      _modeloController.text = widget.veiculo!.modelo;
      _anoController.text = widget.veiculo!.ano;
      _placaController.text = widget.veiculo!.placa;

      _calcularMediaConsumo();
    }
  }

  Future<void> _calcularMediaConsumo() async {
    final controller = context.read<VeiculoController>();

    final media = await controller.calcularMediaConsumo(widget.vehicleId!);
    setState(() {
      mediaConsumo = media;
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.read<VeiculoController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.vehicleId == null ? 'Cadastro de Veículo' : 'Edição de Veículo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Média de Consumo: ${mediaConsumo ?? "Calculando..."}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Input(
                  label: Text('Nome'),
                  controller: _nomeController,
                  validator: (value) => value!.isEmpty ? 'Por favor, insira o nome do veículo' : null,
                ),
                Input(
                  label: Text('Modelo'),
                  controller: _modeloController,
                  validator: (value) => value!.isEmpty ? 'Por favor, insira o modelo do veículo' : null,
                ),
                Input(
                  label: Text('Ano'),
                  controller: _anoController,
                  validator: (value) => value!.isEmpty ? 'Por favor, insira o ano do veículo' : null,
                ),
                Input(
                  label: Text('Placa'),
                  controller: _placaController,
                  validator: (value) => value!.isEmpty ? 'Por favor, insira a placa do veículo' : null,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final novoVeiculo = Veiculo(
                        id: widget.vehicleId ?? '',
                        nome: _nomeController.text,
                        modelo: _modeloController.text,
                        ano: _anoController.text,
                        placa: _placaController.text,
                      );

                      if (widget.vehicleId == null) {
                        await controller.novoVeiculo(context, novoVeiculo);
                      } else {
                        await controller.atualizarVeiculo(widget.vehicleId!, novoVeiculo, context);
                      }

                      Navigator.pop(context);
                    }
                  },
                  child: Text(widget.vehicleId == null ? 'Cadastrar' : 'Salvar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
