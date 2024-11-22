class Veiculo {
  final String id;
  final String nome;
  final String modelo;
  final String ano;
  final String placa;

  Veiculo({
    required this.id,
    required this.nome,
    required this.modelo,
    required this.ano,
    required this.placa,
  });

  factory Veiculo.fromJson(Map<String, dynamic> json, String id) {
    return Veiculo(
      id: id,
      nome: json['nome'] ?? '',
      modelo: json['modelo'] ?? '',
      ano: json['ano'] ?? '',
      placa: json['placa'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'modelo': modelo,
      'ano': ano,
      'placa': placa,
    };
  }
}
