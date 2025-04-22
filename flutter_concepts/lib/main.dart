import 'package:flutter/material.dart';

void main() {
  runApp(MyTest());
}

class MyTest extends StatefulWidget {
  const MyTest({super.key});

    @override
    State<MyTest> createState() => _MyTestState();
}
class _MyTestState extends State<MyTest> {  
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Meu conceito',  
            theme: ThemeData(
                primarySwatch: Colors.blue,
            ),
            home: MyHomePage(),
        );              
      }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {

  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu contador'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Sigo Contando: $contador',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {setState(() {
          contador++;
        },
        );},
        tooltip: 'Mais um',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const <Widget>[
            MyText(),
            MyPicture(),
          ],
        ),
      ),
    );
  }
}

class MyPicture extends StatelessWidget {
  const MyPicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset('');
  }
}
class MyText extends StatelessWidget {
  const MyText({super.key});
  
  @override
  Widget build(BuildContext context) {
    return const Text(
      'Meu texto',
      style: TextStyle(fontSize: 20),
    );
  }
}