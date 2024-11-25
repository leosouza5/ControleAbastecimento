import 'package:abastecimento/cars/screens/cars.dart';
import 'package:abastecimento/enum/enum.dart';
import 'package:abastecimento/models/veiculo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VeiculoController extends ChangeNotifier {
  List<Veiculo> veiculos = [];
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  LocalState listaVeiculoState = LocalState.idle;

  Future<String> calcularMediaConsumo(String vehicleId) async {
    try {
      final userId = FirebaseAuth.instance.currentUser!.uid;

      final refuelsSnapshot = await _firestore.collection('users').doc(userId).collection('vehicles').doc(vehicleId).collection('refuels').orderBy('data', descending: true).get();

      if (refuelsSnapshot.docs.length < 2) {
        return "Abastecimentos insuficientes";
      }

      final currentRefuel = refuelsSnapshot.docs.first.data();
      final previousRefuel = refuelsSnapshot.docs[1].data();

      final double litros = currentRefuel['litros'];
      final int quilometragemAtual = currentRefuel['quilometragem'];
      final int quilometragemAnterior = previousRefuel['quilometragem'];

      final media = (quilometragemAtual - quilometragemAnterior) / litros;

      return "${media.toStringAsFixed(2)} km/L";
    } catch (e) {
      print('Erro ao calcular média de consumo: $e');
      return "Erro ao calcular média";
    }
  }

  recuperaVeiculos() async {
    try {
      final userId = FirebaseAuth.instance.currentUser!.uid;

      _firestore.collection('users').doc(userId).collection('vehicles').snapshots().listen((snapshot) {
        veiculos = snapshot.docs.map((doc) {
          return Veiculo.fromJson(doc.data(), doc.id);
        }).toList();

        listaVeiculoState = LocalState.sucesso;
        notifyListeners();
      }).onError((error) {
        listaVeiculoState = LocalState.error;
        notifyListeners();
      });
    } catch (e) {
      listaVeiculoState = LocalState.error;
      notifyListeners();
      print('Erro ao recuperar veículos: $e');
    }
  }

  Future<void> novoVeiculo(BuildContext context, Veiculo veiculo) async {
    try {
      final userId = FirebaseAuth.instance.currentUser!.uid;

      final docRef = await _firestore.collection('users').doc(userId).collection('vehicles').add(veiculo.toJson());

      veiculo = Veiculo(
        id: docRef.id,
        nome: veiculo.nome,
        modelo: veiculo.modelo,
        ano: veiculo.ano,
        placa: veiculo.placa,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Veículo cadastrado com sucesso!')),
      );

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Cars(),
          ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao cadastrar veículo: $e')),
      );
    }
  }

  Future<void> atualizarVeiculo(String vehicleId, Veiculo veiculo, BuildContext context) async {
    try {
      final userId = FirebaseAuth.instance.currentUser!.uid;

      await _firestore.collection('users').doc(userId).collection('vehicles').doc(vehicleId).update(veiculo.toJson());

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Veículo atualizado com sucesso!')),
      );

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Cars(),
          ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao atualizar veículo: $e')),
      );
    }
  }

  Future<void> deletarVeiculo(String vehicleId, BuildContext context) async {
    try {
      final userId = FirebaseAuth.instance.currentUser!.uid;

      await _firestore.collection('users').doc(userId).collection('vehicles').doc(vehicleId).delete();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Veículo excluído com sucesso!')),
      );

      recuperaVeiculos();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao excluir veículo: $e')),
      );
    }
  }
}
