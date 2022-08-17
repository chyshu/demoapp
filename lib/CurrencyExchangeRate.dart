import 'dart:developer' as developer;

class CurrencyExchangeRate {
  final String code;
  final String alphaCode;
  final String numericCode ;
  final String name;
  final double rate;
  final String date;
  final double inverseRate;
  final String thumbnailUrl;

  const CurrencyExchangeRate({
    required this.code,
    required this.alphaCode,
    required this.numericCode,
    required this.name,
    required this.rate,
    required this.date,
    required this.inverseRate,
    this.thumbnailUrl ="",
  });

  factory CurrencyExchangeRate.fromJson(Map<String, dynamic> json) {
    String url='https://www.jetpunk.com//img/user-photo-library/1a/1ae8ea63cb-450.png';
    if(json['code'] =="USD" )
       url= 'https://cdn.shopify.com/s/files/1/2078/5043/t/59/assets/USD.png?13296612461826194053';
    else if(json['code'] =="GBP" )
      url='https://www.jetpunk.com//img/user-photo-library/1a/1ae8ea63cb-450.png';
    else if(json['code'] =="EUR" )
      url='https://www.jetpunk.com//img/user-photo-library/1a/1ae8ea63cb-450.png';
    else if(json['code'] =="AUD" )
      url='https://www.jetpunk.com//img/user-photo-library/1a/1ae8ea63cb-450.png';
    else if(json['code'] =="RUB" )
      url='https://www.jetpunk.com//img/user-photo-library/1a/1ae8ea63cb-450.png';
    return CurrencyExchangeRate(
      code: json['code'] as String,
      alphaCode: json['alphaCode'] as String,
      numericCode: json['numericCode'] as String,
      name: json['name'] as String,
      rate: json['rate'] as double,
      date: json['date'] as String,
      inverseRate: json['inverseRate'] as double,
        thumbnailUrl: url
    );
  }
}