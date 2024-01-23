import 'package:bytebank/models/contato.dart';
import 'package:bytebank/screens/components/editor.dart';
import 'package:flutter/material.dart';

class FormularioContato extends StatefulWidget {
  FormularioContato({ Key? key }) : super(key: key);

   final TextEditingController _controllerCampoConta= TextEditingController();
   final TextEditingController _controllerCampoNome = TextEditingController();

  @override
  _FormularioContatoState createState() => _FormularioContatoState();
}

class _FormularioContatoState extends State<FormularioContato> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Criando Contato'),),
        body: SingleChildScrollView(
          child: Column(
          children: <Widget>[
            Editor(controlador: widget._controllerCampoConta, rotulo: 'Numero da Conta', dica: '0000'),
            Editor(controlador: widget._controllerCampoNome, rotulo: 'Nome', dica: '', icon: Icons.person_pin_outlined),
            ElevatedButton(
              onPressed: () {
                validationContact(context);
              },
              child: Text('Confirmar'),
            )
          ],
          ),
        ));
  }
  void validationContact(BuildContext context) {
    final String? nome = (widget._controllerCampoNome.text);
    final int? numeroConta = int.tryParse(widget._controllerCampoConta.text);
    if (nome != null && numeroConta != null){
      final _contatoCriado = Contato(nome, numeroConta);
      Navigator.pop(context, _contatoCriado);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:Text('$_contatoCriado'),
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

