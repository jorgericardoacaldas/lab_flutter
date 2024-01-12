import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Scaffold(
    appBar: AppBar(title: Text('Transferências'),),
    body: ListaTransferencias(),
    floatingActionButton: FloatingActionButton(
  onPressed: () { },
      child: Icon(Icons.add),
    ),
  ),
));

class ListaTransferencias extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Column(
      children: <Widget> [
        ItemTransferencia(Transferencia(100.00, 1000)),
        ItemTransferencia(Transferencia(100.00, 1000)),
        ItemTransferencia(Transferencia(100.00, 1000)),
        ItemTransferencia(Transferencia(100.00, 1000)),
        ItemTransferencia(Transferencia(100.00, 1000)),
        ItemTransferencia(Transferencia(100.00, 1000)),
         Card(
        child: ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text('200.0'),
          subtitle: Text('1000'),
        ),
      ),
      ],
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
      title: Text(_transferencia.valor.toString()),
      subtitle: Text(_transferencia.numeroConta.toString()),
    ));
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);
}