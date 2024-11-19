import 'package:barber_shop/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// Estudar InkWell

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
  });

  final List<Map<String, dynamic>> iconData = [
    {'icon': Icons.content_cut, 'label': 'Corte de cabelo'},
    {'icon': Icons.face, 'label': 'Corte de cabelo e barba'},
    {'icon': Icons.face_2, 'label': 'Lavagem de cabelo'},
    {'icon': Icons.content_cut, 'label': 'Tratamento de cabelo'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D3E50),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2D3E50),
        automaticallyImplyLeading: false,
        //primary: false,
        centerTitle: true,
        title: Text(
          'Bem-vindo, ${context.watch<UserProvider>().userName}!',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Todos os serviços',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, //2 colunas
                  crossAxisSpacing: 10, //espaçamento horizontal
                  mainAxisSpacing: 10, // espaçamento vertical
                ),
                itemCount: iconData.length,
                itemBuilder: (context, index) {
                  final item = iconData[index];
                  return Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(item['icon'], size: 40),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          item['label'],
                        )
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/schedule');
                },
                child: const Text(
                  'Agendar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
