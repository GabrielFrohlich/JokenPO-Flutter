import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'JokenPO'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _image = "assets/images/padrao.png";
  var _alternativas = [
    'assets/images/pedra.png',
    'assets/images/papel.png',
    'assets/images/tesoura.png'
  ];

  var _resultado = "Escolha entre Papel, pedra ou tesoura";

  void selected(int btn) {
    var escolhaPc = Random().nextInt(2);
    var result = "";
    print("Clicou");
    if (btn == 0) {
      switch (escolhaPc) {
        case 0:
          result = "Você empatou";
          break;
        case 1:
          result = "Você perdeu";
          break;
        case 2:
          result = "Você ganhou";
          break;
      }
    } else if (btn == 1) {
      switch (escolhaPc) {
        case 0:
          result = "Você ganhou";
          break;
        case 1:
          result = "Você empatou";
          break;
        case 2:
          result = "Você perdeu";
          break;
      }
    } else if (btn == 2) {
      switch (escolhaPc) {
        case 0:
          result = "Você perdeu";
          break;
        case 1:
          result = "Você ganhou";
          break;
        case 2:
          result = "Você empatou";
          break;
      }
    }

    setState(() {
      _resultado = result;
      _image = _alternativas[escolhaPc];
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its psarent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be6
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('Escolha do computador:'),
            Image.asset(_image, scale: 1.5),
            Text('Escolha uma opções'),
            Row(children: [
              GestureDetector(
                  child: Image.asset('assets/images/pedra.png', scale: 1.5),
                  onTap: () => selected(0)),
              GestureDetector(
                  child: Image.asset('assets/images/papel.png', scale: 1.5),
                  onTap: () => selected(1)),
              GestureDetector(
                  child: Image.asset('assets/images/tesoura.png', scale: 1.5),
                  onTap: () => selected(2))
            ], mainAxisAlignment: MainAxisAlignment.spaceEvenly),
            Text(_resultado)
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
