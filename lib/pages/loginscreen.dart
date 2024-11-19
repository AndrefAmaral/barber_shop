import 'package:barber_shop/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

/*
O TextEditingController é uma classe no Flutter que permite controlar o texto de um TextField

Como usar?
1- Criar uma instância do TextEditingController
2- Associá-lo ao TextField
3- Para acessar o texto inserido pelo usuário, você pode usar _controller.text.
4- Você pode modificar o texto do campo de entrada atribuindo um novo valor ao controller.
*/
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login(BuildContext context) {
    context
        .read<UserProvider>()
        .changeUserName(newUserName: _userNameController.text);
    FocusManager.instance.primaryFocus?.unfocus();
    if (_userNameController.text == 'Andre' &&
        _passwordController.text == '123') {
      Navigator.pushNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D3E50),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const Text(
                  'Barber Shop',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Image.asset('assets/images/logobarber1.jpg'),
                //Envolvi o column com expandend e não funcionou
                Column(
                  children: [
                    TextField(
                      controller: _userNameController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Digite seu Nome',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _passwordController,
                      textAlign: TextAlign.center,
                      obscureText: true,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Senha',
                        hintStyle: TextStyle(),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () => _login(context),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text(
                    'Entrar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
