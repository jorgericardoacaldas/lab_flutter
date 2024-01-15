import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/screens/formulario_transferencia.dart';
import 'package:flutter/material.dart';

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
