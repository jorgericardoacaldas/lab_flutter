import 'package:flutter/material.dart';
import 'package:flutter_estudos/login_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ExpansionTile(
            title: Text('Configurações'),
            children: [
              ListTile(
                title: Text('Configuração 1'),
                onTap: () {
                },
              ),
              ListTile(
                title: Text('Configuração 2'),
                onTap: () {
                },
              ),
            ],
          ),
          ListTile(
            title: Text('Sair'),
            onTap: () {

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );              
                // Navigator.pop(context); // Fecha o Drawer
              
            },
          ),
        ],
      ),
    );
  }
}