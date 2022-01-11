class CotacaoBellPiper{
    CotacaoBellPiper(
      {required this.month, required this.priceMin, required this.priceMc, required this.priceMax});
  final String month;
  final String priceMin;
  final String priceMc;
  final String priceMax;

  factory CotacaoBellPiper.fromJson(Map<String, dynamic> json) => CotacaoBellPiper(
      month: json['month'],
      priceMin: json['priceMin'],
      priceMc: json['priceMc'],
      priceMax: json['priceMax']);
}