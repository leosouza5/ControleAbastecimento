import 'package:abastecimento/auth/components/input.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../util/util.dart';

class EsqueciSenha extends StatelessWidget {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  EsqueciSenha({super.key});

  Future<void> _sendPasswordResetEmail(BuildContext context) async {
    try {
      final email = _emailController.text.trim();
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Email de redefinição de senha enviado!')),
      );

      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fundoSecundaria,
      appBar: AppBar(
        iconTheme: IconThemeData(color: textoPrincipal),
        backgroundColor: fundoPrincipal,
        title: Text(
          'Recuperar Senha',
          style: TextStyle(color: textoPrincipal),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Digite seu email para receber um link de redefinição de senha:',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Input(
                controller: _emailController,
                label: Text(
                  "Email",
                  style: TextStyle(color: textoPrincipal),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Por favor, insira um email válido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: botoesDestaque),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _sendPasswordResetEmail(context);
                  }
                },
                child: Text(
                  'Enviar Email de Recuperação',
                  style: TextStyle(color: textoPrincipal),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
