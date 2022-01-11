import 'dart:convert';

import 'package:agrowebpragasdoencas/model/cotacao-bell-piper.dart';
import 'package:agrowebpragasdoencas/model/cotacao-stramberry.dart';
import 'package:agrowebpragasdoencas/model/hortalicas.dart';
import 'package:agrowebpragasdoencas/model/pimentao.dart';
import 'package:agrowebpragasdoencas/model/cotacao-tomato.dart';
import 'package:agrowebpragasdoencas/model/tomate.dart';
import 'package:agrowebpragasdoencas/model/tree-culturas.dart';
import 'package:http/http.dart' as http;
import 'package:agrowebpragasdoencas/model/morango.dart';
import 'package:agrowebpragasdoencas/model/data.dart';
import 'dart:async';

class Api {
  static Future<Morango> getMorango() async {
    final url = Uri.parse("https://apiceasa.herokuapp.com/api/cotacaoMorango");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return Morango.fromJson(jsonDecode(response.body));
    } else {
      throw Exception();
    }
  }

  static Future<Data> getData() async {
    final url = Uri.parse("https://apiceasa.herokuapp.com/api/data");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return Data.fromJson(jsonDecode(response.body));
    } else {
      throw Exception();
    }
  }

  static Future<List<Pimentao>> getPimentao() async {
    final url = Uri.parse("https://apiceasa.herokuapp.com/api/cotacaoPimentao");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return parsePimentao(response.body);
    } else {
      throw Exception();
    }
  }

  static Future<List<Tomate>> getTomate() async {
    final url = Uri.parse("https://apiceasa.herokuapp.com/api/cotacaoTomate");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return parseTomate(response.body);
    } else {
      throw Exception();
    }
  }

  static Future<List<Hortalicas>> getHortalicas() async {
    final url =
        Uri.parse("https://apiceasa.herokuapp.com/api/cotacaoHortalicas");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return parseHortlicas(response.body);
    } else {
      throw Exception();
    }
  }

  static Future<List<TreeCulturas>> getGeral() async {
    final url =
        Uri.parse("https://apiceasa.herokuapp.com/api/cotacaoTresCulturas");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return parseGeral(response.body);
    } else {
      return throw Exception();
    }
  }

  static Future<List<CotacaoTomato>> getPriceMinTomato() async {
    final url = Uri.parse(
        "https://contweb.net.br/Sistema/public/api/cotacaoMensalTomato");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return parsePriceTomato(response.body);
    } else {
      return throw Exception();
    }
  }

  static Future<List<CotacaoStramberry>> getPriceStramberry() async {
    final url = Uri.parse(
        "https://contweb.net.br/Sistema/public/api/cotacaoMensalStramberry");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return parsePriceStramberry(response.body);
    } else {
      return throw Exception();
    }
  }

  static Future<List<CotacaoBellPiper>> getPriceBellPiper() async {
    final url = Uri.parse(
        "https://contweb.net.br/Sistema/public/api/cotacaoMensalBellPiper");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return parsePriceBellPiper(response.body);
    } else {
      return throw Exception();
    }
  }

  static List<CotacaoBellPiper> parsePriceBellPiper(String responseBody) {
    var parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<CotacaoBellPiper>((json) => CotacaoBellPiper.fromJson(json))
        .toList();
  }

  static List<CotacaoStramberry> parsePriceStramberry(String responseBody) {
    var parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<CotacaoStramberry>((json) => CotacaoStramberry.fromJson(json))
        .toList();
  }

  static List<CotacaoTomato> parsePriceTomato(String responseBody) {
    var parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<CotacaoTomato>((json) => CotacaoTomato.fromJson(json))
        .toList();
  }

  static List<TreeCulturas> parseGeral(String responseBody) {
    var parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<TreeCulturas>((json) => TreeCulturas.fromJson(json))
        .toList();
  }

  static List<Hortalicas> parseHortlicas(String responseBody) {
    var parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Hortalicas>((json) => Hortalicas.fromJson(json)).toList();
  }

  static List<Pimentao> parsePimentao(String responseBody) {
    var parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Pimentao>((json) => Pimentao.fromJson(json)).toList();
  }

  static List<Tomate> parseTomate(String responseBody) {
    var parse = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parse.map<Tomate>((json) => Tomate.fromJson(json)).toList();
  }
}
