import 'package:abastecimento/abastecimento/screens/abastecimentos.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../enum/enum.dart';

class AbastecimentoController extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  LocalState listaAbastecimentosState = LocalState.idle;
  List<Map<String, dynamic>> abastecimentos = [];

  Future<void> recuperarTodosAbastecimentos() async {
    try {
      listaAbastecimentosState = LocalState.loading;
      notifyListeners();

      final userId = FirebaseAuth.instance.currentUser!.uid;

      final vehicleSnapshot = await _firestore.collection('users').doc(userId).collection('vehicles').get();

      List<Map<String, dynamic>> todosAbastecimentos = [];

      for (var vehicleDoc in vehicleSnapshot.docs) {
        final vehicleData = vehicleDoc.data();
        final vehicleId = vehicleDoc.id;

        final refuelSnapshot = await _firestore.collection('users').doc(userId).collection('vehicles').doc(vehicleId).collection('refuels').orderBy('data', descending: true).get();

        for (var refuelDoc in refuelSnapshot.docs) {
          final refuelData = refuelDoc.data();
          todosAbastecimentos.add({
            'vehicleId': vehicleId,
            'vehicleName': vehicleData['nome'],
            'vehicleModel': vehicleData['modelo'],
            'litros': refuelData['litros'],
            'quilometragem': refuelData['quilometragem'],
            'data': refuelData['data'],
          });
        }
      }

      abastecimentos = todosAbastecimentos;
      listaAbastecimentosState = LocalState.sucesso;
      notifyListeners();
    } catch (e) {
      listaAbastecimentosState = LocalState.error;
      notifyListeners();
      print('Erro ao recuperar abastecimentos: $e');
    }
  }

  Future<List<Map<String, dynamic>>> recuperarVeiculos() async {
    try {
      final userId = FirebaseAuth.instance.currentUser!.uid;

      final snapshot = await _firestore.collection('users').doc(userId).collection('vehicles').get();

      return snapshot.docs.map((doc) {
        return {
          'id': doc.id,
          'nome': doc.data()['nome'],
          'modelo': doc.data()['modelo'],
        };
      }).toList();
    } catch (e) {
      print('Erro ao recuperar veículos: $e');
      return [];
    }
  }

  Future<void> registrarAbastecimento({
    required BuildContext context,
    required String vehicleId,
    required double litros,
    required int quilometragem,
    required String data,
  }) async {
    try {
      final userId = FirebaseAuth.instance.currentUser!.uid;

      await _firestore.collection('users').doc(userId).collection('vehicles').doc(vehicleId).collection('refuels').add({
        'litros': litros,
        'quilometragem': quilometragem,
        'data': data,
        'registradoEm': DateTime.now().toIso8601String(),
      });

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Abastecimento registrado com sucesso!')));

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Abastecimentos(),
          ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Erro ao registrar abastecimento: $e')));
    }
  }
}
