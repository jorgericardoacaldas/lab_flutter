import 'package:flutter/material.dart';
import 'package:flutter_estudos/user.dart';
import 'package:flutter_estudos/home.dart';
import 'package:flutter_estudos/app_theme.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_screen.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _Loading;
  const factory LoginState.success() = _Success;
  const factory LoginState.error(String error) = _Error;
}

@freezed
abstract class LoginEvent with _$LoginEvent {
  const factory LoginEvent.loginPressed(UserModel user) = _LoginPressed;
}

// ignore: use_key_in_widget_constructors
class LoginScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginState _state;
  late UserModel _user;

  @override
  void initState() {
    super.initState();
    // ignore: prefer_const_constructors
    _state = LoginState.initial();
        _user = UserModel(username: '', password: ''); // Inicialize o objeto UserModel

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Username'),
              onChanged: (value) {
                setState(() {
                  _user = _user.copyWith(username: value);
                });
              },
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
              onChanged: (value) {
              setState(() {
                  _user = _user.copyWith(password: value);
                });              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                //login de sucesso. 
                if ((_user.username == "teste") && (_user.password == "teste")){
                  setState(() {
                    _state = LoginState.success();
                  });

                  // Navegue para a tela Home
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                
                }
                else
                {
                  setState(() {
                    _state = LoginState.error("Login Invalido.");
                  });
                }
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 16),
            if (_state.maybeWhen(loading: () => true, orElse: () => false)) CircularProgressIndicator(),
            
            if (_state.maybeWhen(error: (error) => true, orElse: () => false)) 
                  Text(
                   (_state as _Error).error,
                  style: TextStyle(color: Colors.red),
                ),




          ],
        ),
      ),
    );
  }
}
