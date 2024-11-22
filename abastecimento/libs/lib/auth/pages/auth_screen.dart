import 'package:abastecimento/auth/components/input.dart';
import 'package:abastecimento/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Abastecimento"),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Input(
                  label: Text("Usuario"),
                ),
                Input(
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      return null;
                    } else {
                      return "Informe uma senha válida";
                    }
                  },
                  label: Text("Senha"),
                  senha: true,
                  borderColor: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Cadastrar",
                        style: TextStyle(fontSize: 20),
                      )),
                ),
                Padding(padding: EdgeInsets.all(20)),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ));
                  },
                  child: Text("Iniciar"),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    minimumSize: Size.fromHeight(70),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
