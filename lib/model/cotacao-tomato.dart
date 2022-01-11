class CotacaoTomato {
  CotacaoTomato(
      {required this.month, required this.priceMin, required this.priceMc, required this.priceMax});
  final String month;
  final String priceMin;
  final String priceMc;
  final String priceMax;

  factory CotacaoTomato.fromJson(Map<String, dynamic> json) => CotacaoTomato(
      month: json['month'],
      priceMin: json['priceMin'],
      priceMc: json['priceMc'],
      priceMax: json['priceMax']);
}
