import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'ToDo.dart';
import 'dart:async';
import 'dart:convert';
import 'CurrencyExchangeRate.dart';
import 'dart:developer' as developer;
import 'ExchangeDetail.dart';

Future<List<CurrencyExchangeRate>> fetchCurrency(http.Client client) async {

  final response = await client.get(Uri.parse('https://highschool.resident.ncnu.edu.tw/exchangerate.json'));

  // Use the compute function to run parsePhotos in a separate isolate.

  return compute(parseCurrency, response.body );
}

// A function that converts a response body into a List<Photo>.
List<CurrencyExchangeRate> parseCurrency(String responseBody) {
  //developer.log( responseBody );
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<CurrencyExchangeRate>(
           (json) =>   CurrencyExchangeRate.fromJson(json)
  ).toList();
}



class CurrencyScreen extends StatelessWidget {
  // In the constructor, require a Todo.
  const CurrencyScreen({super.key, required this.todo});

  // Declare a field that holds the Todo.
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    // developer.log( context.toString() );
    return Scaffold(
        appBar: AppBar(
            title: Text(todo.title),
        ),
        body:
        FutureBuilder<List<CurrencyExchangeRate>>(
            future: fetchCurrency(http.Client()),
            builder: (context, snapshot) {
                     // developer.log( snapshot.data.toString() );
                    if (snapshot.hasError) {
                        return const Center(
                            child: Text('An error has occurred!'),
                        );
                    } else if (snapshot.hasData) {
                         return CurrencyList( currency: snapshot.data!);
                    } else {
                        return const Center(
                            child: CircularProgressIndicator(),
                        );
                    }
            },
          ),
      );
  }


}

class CurrencyList extends StatelessWidget {
  const CurrencyList({super.key, required this.currency});

  final List<CurrencyExchangeRate> currency;

  @override
  Widget build(BuildContext context) {
    //developer.log( "CurrencyList" );
    return ListView.builder(

          padding: EdgeInsets.all(8),
          shrinkWrap: true,
          itemCount: currency.length,
          itemBuilder: (context, index) {
            return Container(
              height: 92.0,
              child: new ListTile(
                  title: new Text( currency[index].name),
                  subtitle:
                    Column(
                      children: <Widget>[
                        Align( alignment: Alignment.centerLeft, child: Text(currency[index].rate.toString() ) ),
                        Align( alignment: Alignment.centerLeft,  child: Text(currency[index].date.toString()) ),
                      ],
                    ),
                    leading:   Image.network( currency[index].thumbnailUrl ,width: 80, height:80,  ),
                    trailing: new Icon(Icons.chevron_right),
                    onTap: (){
                        Navigator.of(context).push(
                        MaterialPageRoute(builder:
                                (context)=> ExchangeDetail( currencyExchangeRate: currency[index],)));

                      },
                ),
                // Image.network( currency[index].thumbnailUrl ,width: 80, height:80,  );
            );
          },

    );
  }
}
