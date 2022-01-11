class Data {
  final String data;

  const Data({required this.data});


  factory  Data.fromJson(Map<String, dynamic> json) => Data(data: json['data']);
}


