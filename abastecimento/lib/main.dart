import 'package:abastecimento/abastecimento/controllers/abastecimento_controller.dart';
import 'package:abastecimento/cars/controllers/veiculo_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import 'auth/controller/auth_controller.dart';
import 'auth/pages/auth_screen.dart';
import 'util/theme.dart';
import 'util/util.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseFirestore.instance.settings = const Settings(persistenceEnabled: true);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, "Poppins", "Poppins");
    MaterialTheme theme = MaterialTheme(textTheme);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => VeiculoController()),
        ChangeNotifierProvider(create: (context) => AbastecimentoController()),
        ChangeNotifierProvider(create: (context) => AuthController()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: theme.light(),
        home: AuthScreen(),
      ),
    );
  }
}
