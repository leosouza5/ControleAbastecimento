import 'package:abastecimento/lib/util/drawer_default.dart';
import 'package:flutter/material.dart';

class NovoAbastecimento extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _litrosController = TextEditingController();
  final TextEditingController _quilometragemController = TextEditingController();
  final TextEditingController _dataController = TextEditingController();

  NovoAbastecimento({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerDefault(),
      appBar: AppBar(
        title: Text('Novo Abastecimento'),
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
                  controller: _litrosController,
                  decoration: InputDecoration(labelText: 'Quantidade de Litros'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira a quantidade de litros';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _quilometragemController,
                  decoration: InputDecoration(labelText: 'Quilometragem Atual'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira a quilometragem atual';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _dataController,
                  decoration: InputDecoration(
                    labelText: 'Data',
                    hintText: 'DD/MM/AAAA',
                  ),
                  keyboardType: TextInputType.datetime,
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
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Implementar lógica de salvar o abastecimento
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Abastecimento registrado com sucesso!')),
                      );
                      Navigator.pop(context); // Voltar ao histórico
                    }
                  },
                  child: Text('Registrar Abastecimento'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
