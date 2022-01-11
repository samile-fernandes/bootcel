class TreeCulturas {
    final int id;
  final String nome;
  final String und;
  final String sit;
  final String min;
  final String mc;
  final String max;
  final String procedencia;

  const TreeCulturas({  required this.id,
     required this.nome,
     required this.und,
     required this.sit,
     required this.min,
     required this.mc,
    required this.max,
    required this.procedencia,});

  factory TreeCulturas.fromJson(Map<String, dynamic> json) =>
      TreeCulturas(id: json['id'],
      nome: json['nome'],
      und: json['und'],
      sit: json['sit'],
      min: json['min'],
      mc: json['mc'],
      max: json['max'],
      procedencia: json['procedencia']);
}
