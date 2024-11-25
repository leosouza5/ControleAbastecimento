import 'package:abastecimento/auth/pages/esqueci_senha.dart';
import 'package:abastecimento/auth/pages/register_screen.dart';
import 'package:abastecimento/util/util.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../components/input.dart';
import '../../home/screens/home_screen.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  Future<void> _login(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: senhaController.text.trim(),
      );
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erro ao fazer login!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Abastecimento",
          style: TextStyle(color: textoPrincipal),
        ),
        backgroundColor: fundoPrincipal,
      ),
      body: Container(
        decoration: BoxDecoration(color: fundoSecundaria),
        child: Center(
          child: Container(
            decoration: BoxDecoration(color: fundoSecundaria),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Input(
                      controller: emailController,
                      validator: (value) {
                        if (value != null && value.isNotEmpty) {
                          return null;
                        } else {
                          return "Informe um email válido";
                        }
                      },
                      label: Text("email"),
                    ),
                    Input(
                      validator: (value) {
                        if (value != null && value.isNotEmpty) {
                          return null;
                        } else {
                          return "Informe uma senha válida";
                        }
                      },
                      controller: senhaController,
                      label: Text("Senha"),
                      senha: true,
                      borderColor: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterScreen(),
                                ));
                          },
                          child: Text(
                            "Cadastrar",
                            style: TextStyle(fontSize: 20, color: Color(0xFFA3A3A3)),
                          )),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EsqueciSenha(),
                                ));
                          },
                          child: Text(
                            "Esqueci a senha",
                            style: TextStyle(fontSize: 20, color: Color(0xFFA3A3A3)),
                          )),
                    ),
                    Padding(padding: EdgeInsets.all(20)),
                    ElevatedButton(
                      onPressed: () {
                        _login(context);
                      },
                      child: Text(
                        "Iniciar",
                        style: TextStyle(color: textoPrincipal),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: botoesDestaque,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        minimumSize: Size.fromHeight(70),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
