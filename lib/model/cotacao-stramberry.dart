class CotacaoStramberry{
    CotacaoStramberry(
      {required this.month, required this.priceMin, required this.priceMc, required this.priceMax});
  final String month;
  final String priceMin;
  final String priceMc;
  final String priceMax;

  factory CotacaoStramberry.fromJson(Map<String, dynamic> json) => CotacaoStramberry(
      month: json['month'],
      priceMin: json['priceMin'],
      priceMc: json['priceMc'],
      priceMax: json['priceMax']);
}