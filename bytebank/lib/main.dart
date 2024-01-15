import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData( colorScheme: ColorScheme.fromSwatch( primarySwatch: Colors.green, ).copyWith( secondary: Colors.blueAccent[700], ), buttonTheme: ButtonThemeData( buttonColor: Colors.blueAccent[700], textTheme: ButtonTextTheme.primary ), ),
      home: ListaTransferencias(),
      
    );
  }
}

class FormularioTransferencia extends StatefulWidget {

  final TextEditingController _controllerCampoNumeroConta = TextEditingController();
final TextEditingController _controllerCampoValor = TextEditingController();
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Criando Transferência'),),
        body: SingleChildScrollView(
          child: Column(
          children: <Widget>[
            Editor(controlador: widget._controllerCampoNumeroConta, rotulo: 'Numero da Conta', dica: '0000'),
            Editor(controlador: widget._controllerCampoValor, rotulo: 'Valor', dica: '10.00', icon: Icons.monetization_on),
            ElevatedButton(
              onPressed: () {
                validationTransfer(context);
              },
              child: Text('Confirmar'),
            )
          ],
          ),
        ));
  }

  void validationTransfer(BuildContext context) {
    final int? numeroConta = int.tryParse(widget._controllerCampoNumeroConta.text);
    final double? valor = double.tryParse(widget._controllerCampoValor.text);
    if (numeroConta != null && valor != null){
      final _transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, _transferenciaCriada);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:Text('$_transferenciaCriada'),
          action: SnackBarAction(
            label: 'Action',
            onPressed: () {
              // Code to execute.
            },
          ),
        ),
      );               
    }
  }
}

class ListaTransferencias extends StatefulWidget {

  final List<Transferencia> _transferencias = [];

  @override
  
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencias>{

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: widget._transferencias.length,
        itemBuilder: (BuildContext context, int index) {
          final transferencia =  widget._transferencias[index];
          return ItemTransferencia(transferencia);
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {  
            final Future<Transferencia?> future =  Navigator.push(context, MaterialPageRoute(builder: (context){
            return FormularioTransferencia();
          }));
          future.then((transferenciaRecebida) {
            setState(() {
              if (transferenciaRecebida?.numeroConta != null && transferenciaRecebida?.valor != null){
                widget._transferencias.add(transferenciaRecebida!);  
              }
              
            });
            
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {

  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text(_transferencia.numeroConta.toString()),
      subtitle: Text(_transferencia.valor.toString()),
    ));
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  String toString(){
    return 'Tranferencia{valor: $valor numeroConta $numeroConta}';
  }
}

class Editor extends StatelessWidget {

  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData ?icon;

  Editor({required this.controlador, required this.rotulo, required this.dica, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: controlador,
                style: TextStyle(
                  fontSize: 24.0
                ),
                decoration: InputDecoration(
                  icon: Icon(icon),
                  labelText: rotulo,
                  hintText: dica
                ),
                keyboardType: TextInputType.number,
              ),
            );
  }
}