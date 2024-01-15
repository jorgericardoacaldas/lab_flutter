import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/screens/components/editor.dart';
import 'package:flutter/material.dart';

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
