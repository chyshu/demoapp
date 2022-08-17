import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'CurrencyExchangeRate.dart';

class ExchangeDetail extends StatefulWidget  {

  const ExchangeDetail({Key? key, required this.currencyExchangeRate}) : super(key: key);
  final CurrencyExchangeRate currencyExchangeRate;
  @override
  _ExchangeDetail createState() => _ExchangeDetail();
}
class _ExchangeDetail extends State<ExchangeDetail> {
   bool inChanged= false;
   double _TwdValue = 0;
   double _ForigenValue = 0;
   final TextEditingController ForigenValueCtrl = TextEditingController();
   final TextEditingController TWDValueCtrl= TextEditingController();
   @override
   void initState() {
     super.initState();

     // Start listening to changes.
     ForigenValueCtrl.addListener(_forigenValueListener);
     TWDValueCtrl.addListener(_twdValueListener);
   }
   @override
   void dispose() {
     // Clean up the controller when the widget is removed from the widget tree.
     // This also removes the _printLatestValue listener.
     ForigenValueCtrl.dispose();
     TWDValueCtrl.dispose();
     super.dispose();
   }

   void _forigenValueListener() {
     //print('Second text field: ${txt.text}');


   }
   void _twdValueListener(){
/*
        _TwdValue = double.tryParse(TWDValueCtrl.text)??0.0;

      _ForigenValue = widget.currencyExchangeRate.rate * _TwdValue;
        ForigenValue.
      forigenValue.text=_ForigenValue.toString();*/
   }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(  widget.currencyExchangeRate.name),),
      body:
    Container(
      padding: const EdgeInsets.all(20),
        child: Column(

        children: [
        Align( alignment: Alignment.centerLeft,
          child: Image( image: AssetImage(   widget.currencyExchangeRate.thumbnailUrl) ,width: 80),
        ),
         SizedBox(
            height: 10,
          ),
          Align( alignment: Alignment.centerLeft,
             child: Text("Currency Code:" + widget.currencyExchangeRate.alphaCode,
                   style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12)
              )),
          Align( alignment: Alignment.centerLeft,
              child: Text(widget.currencyExchangeRate.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12) )),
          Align( alignment: Alignment.centerLeft,
              child: Text("1 TWD 可兌換 "+ widget.currencyExchangeRate.rate.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16) )),
          Align( alignment: Alignment.centerLeft,
              child: Text("1 ${widget.currencyExchangeRate.alphaCode} 可兌換 "+ widget.currencyExchangeRate.inverseRate.toString()+" TWD",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16) )),
          Align( alignment: Alignment.centerLeft,
              child: Text(widget.currencyExchangeRate.date.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12) )),
          SizedBox(
            height: 2,
          ),
          Align( alignment: Alignment.centerLeft,
              child: Text("輸入台幣匯款金額" ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16) )),
          TextField(
            decoration: InputDecoration(hintText: '輸入台幣匯款金額'),
            keyboardType: TextInputType.number,
            controller: TWDValueCtrl,
            inputFormatters: <TextInputFormatter>[              FilteringTextInputFormatter.digitsOnly            ], // Only numbers can be enter
            onChanged: (text) {
              if(!inChanged) {
                inChanged = true;
                try {
                  _TwdValue =  double.tryParse(text) ?? 0.0;
                  String inString = _TwdValue.toStringAsFixed(0);
                  _TwdValue= double.tryParse(inString) ?? 0.0;
                  double f =
                      widget.currencyExchangeRate.rate * _TwdValue;
                  inString = f.toStringAsFixed(0);
                  _ForigenValue = double.tryParse(inString) ?? 0.0;
                  ForigenValueCtrl.text = _ForigenValue.toString();
                }
                finally {
                  inChanged = false;
                }
              }
            },
          ),
          SizedBox(
            height: 2,
          ),
          Align( alignment: Alignment.centerLeft,
              child: Text( widget. currencyExchangeRate.name+  "金額" ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16) )),
          TextField(
            decoration: InputDecoration(hintText: '輸入${widget.currencyExchangeRate.name}匯款金額'),
            keyboardType: TextInputType.number,
            controller: ForigenValueCtrl,
            inputFormatters: <TextInputFormatter>[              FilteringTextInputFormatter.digitsOnly            ], // Only numbers can be entered
            onChanged: (text) {
              if(!inChanged) {
                inChanged = true;
                try {
                  _ForigenValue = double.tryParse(text) ?? 0.0;

                  _TwdValue =
                      widget.currencyExchangeRate.inverseRate * _ForigenValue;
                  TWDValueCtrl.text = _TwdValue.toString();
                }
                finally {
                  inChanged = false;
                }
              }
            },
          )
        ],
      ),
    )
    );
  }


}
