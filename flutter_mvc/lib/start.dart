import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Start extends StatelessWidget {
  const Start({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Padding(padding: const EdgeInsets.only(top: 104.0)),
      SvgPicture.asset("assets/images/logo.svg"),
      Padding(padding: const EdgeInsets.only(top: 104.0)),
      ElevatedButton(onPressed: (){}, child: const Text("Entrar")),
    ],);
  }
}