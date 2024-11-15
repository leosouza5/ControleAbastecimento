import 'package:abastecimento/lib/util/drawer_default.dart';
import 'package:flutter/material.dart';

class NewCar extends StatelessWidget {
  NewCar({super.key});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _modeloController = TextEditingController();
  final TextEditingController _anoController = TextEditingController();
  final TextEditingController _placaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerDefault(),
      appBar: AppBar(
        title: Text('Cadastro de Veículo'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _nomeController,
                  decoration: InputDecoration(labelText: 'Nome'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o nome do veículo';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _modeloController,
                  decoration: InputDecoration(labelText: 'Modelo'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o modelo do veículo';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _anoController,
                  decoration: InputDecoration(labelText: 'Ano'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o ano do veículo';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _placaController,
                  decoration: InputDecoration(labelText: 'Placa'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira a placa do veículo';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Implementar lógica de salvar o veículo
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Veículo cadastrado com sucesso!')),
                      );
                      Navigator.pop(context); // Voltar à lista
                    }
                  },
                  child: Text('Cadastrar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
