import 'package:flutter/cupertino.dart';

class Culturas {
  final String images;
  final String nome;
  final String ovalImages;
  final Widget link;

  const Culturas(
      {required this.images,
      required this.nome,
      required this.ovalImages,
      required this.link});

  factory Culturas.fromJson(Map<String, dynamic> json) => Culturas(
      images: json['images'],
      nome: json['nome'],
      ovalImages: json['ovalImages'],
      link: json['link']);

      Map<String, dynamic> toJson() => {
        'images': images,
        'nome': nome,
        'ovalImages': ovalImages,
        'link': link,
      };

}
