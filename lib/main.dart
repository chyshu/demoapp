import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'DetailScreen.dart';
import 'ToDo.dart';
import 'CurrencyScreen.dart';

void main() {

  runApp(const MyDemoApp( ));
}

class MyDemoApp extends StatelessWidget {
  const MyDemoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyDemoAppHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyDemoAppHomePage extends StatefulWidget {
  const MyDemoAppHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyDemoAppHomePage> createState() => _MyDemoAppHomePage();
}

class _MyDemoAppHomePage extends State<MyDemoAppHomePage> {
  int _counter = 0;
  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("demo"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.share), onPressed: () {}),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            SizedBox(
               height : 90.0,
               child: DrawerHeader(
                    decoration: BoxDecoration( color: Colors.brown, ),
                    child:
                          Align(
                            alignment: Alignment.center,
                            child:
                             Text(
                                'Demo Menu 80',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 24,
                                    fontStyle: FontStyle.italic,
                                ),
                             ),
                           ),
                      ),
                  ),
            Card(child:ListTile(
              title: Text('Item 1',style:TextStyle(  fontSize: 20)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(todo: Todo( 'Demo Of Images' ,'Item 1')),
                  ),
                );
              },
            )),
             Card(child:ListTile(
              title: Text('Item 2',style:TextStyle( color: Color.fromARGB(182, 128,39, 57), fontSize: 20)),
               onTap: () {
                 Navigator.push(
                   context,
                   MaterialPageRoute(
                     builder: (context) => CurrencyScreen(todo: Todo( 'Demo of Text' ,'Item 2')),
                   ),
                 );
               },
             )),
          ],
          shrinkWrap: true,
          reverse: false,
          padding: EdgeInsets.all(10),
        ),
      ),
      body: Center(child:
         Text('You have pressed the button $_counter times.\n You have selected the item $_selectedIndex',
             style: TextStyle(  color: Colors.red, fontSize: 16, fontStyle: FontStyle.italic,)
          ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed:_incrementCounter
      ),
    );
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }



  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }


}
