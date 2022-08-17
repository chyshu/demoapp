import 'dart:developer' as developer;
import 'dart:io';

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
    String path=
      File('graphics/flags/'+json['code'].toLowerCase() +'.png' ).existsSync() ?
    'graphics/flags/'+json['code'].toLowerCase() +'.png' :'graphics/flags/'+json['code'].toLowerCase() +'.png';


    return CurrencyExchangeRate(
      code: json['code'] as String,
      alphaCode: json['alphaCode'] as String,
      numericCode: json['numericCode'] as String,
      name: json['name'] as String,
      rate: json['rate'] as double,
      date: json['date'] as String,
      inverseRate: json['inverseRate'] as double,
        thumbnailUrl: path
    );
  }
}