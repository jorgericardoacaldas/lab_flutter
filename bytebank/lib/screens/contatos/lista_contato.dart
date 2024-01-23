import 'package:bytebank/models/contato.dart';
import 'package:bytebank/screens/contatos/formulario_contato.dart';
import 'package:bytebank/screens/transferencia/formulario_transferencia.dart';
import 'package:bytebank/screens/transferencia/lista_transferencia.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatefulWidget {
  final List<Contato> _contatos = [];

  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ContactsListState();
  }
}

class ContactsListState extends State<ContactsList>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos'),
      ),
      body: ListView.builder(
        itemCount: widget._contatos.length,
        itemBuilder: (BuildContext context, int index) {
          final _contato =  widget._contatos[index];
          return itemContact(contato: _contato);
        }     
      ) ,
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          final Future<Contato?> future = Navigator.push(context, MaterialPageRoute(builder: (context){
              return FormularioContato();
          }));
          
          future.then((contatoNew) {
            setState(() {
              if (contatoNew?.numeroConta != null && contatoNew?.nome != null){
                widget._contatos.add(contatoNew!);  
              }
            });
            
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }

}

class itemContact extends StatelessWidget {
  final Contato contato;
  const itemContact({
    super.key, required this.contato,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(contato.nome),
        subtitle: Text(contato.numeroConta.toString()),
      ),
    );
  }
}