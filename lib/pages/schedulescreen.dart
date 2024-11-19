import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  DateTime selectedDate = DateTime.now();

  //Lista de serviços
  final List<String> services = [
    'Corte de cabelo',
    'Corte de cabelo e barba',
    'Lavagem de cabelo',
    'Tratamento de cabelo',
  ];

  //Serviço selecionado
  String? selectedService;

  // Lista de profissionais (apenas nomes como exemplo)
  final List<String> professionals = [
    'João',
    'Maria',
    'Carlos',
    'Ana',
    'Pedro',
  ];

  // Profissional selecionado
  String? selectedProfessional;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Agendamento',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF2D3E50),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.black,
              width: double.infinity,
              height: 40,
              child: const Center(
                child: Text(
                  'Serviço',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            DropdownButton<String>(
              hint: const Text('Selecione um serviço'),
              value: selectedService,
              items: services.map((String service) {
                return DropdownMenuItem<String>(
                  value: service,
                  child: Text(service),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedService = newValue;
                });
              },
            ),
            const SizedBox(height: 20),
            Card(
              color: const Color.fromARGB(255, 209, 207, 207),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: // Exibir o serviço selecionado
                      Text(
                    selectedService == null
                        ? 'Nenhum serviço selecionado'
                        : 'Serviço selecionado: $selectedService',
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              color: Colors.black,
              width: double.infinity,
              height: 40,
              child: const Center(
                child: Text(
                  'Profissional',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            DropdownButton<String>(
              hint: const Text('Selecione um profissional'),
              value: selectedProfessional,
              items: professionals.map((String professional) {
                return DropdownMenuItem<String>(
                  value: professional,
                  child: Text(professional),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedProfessional = newValue;
                });
              },
            ),
            const SizedBox(height: 20),
            Card(
              color: const Color.fromARGB(255, 209, 207, 207),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: // Exibir o profissional selecionado
                      Text(
                    selectedProfessional == null
                        ? 'Nenhum profissional selecionado'
                        : 'Profissional selecionado: $selectedProfessional',
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              color: Colors.black,
              width: double.infinity,
              height: 40,
              child: const Center(
                child: Text(
                  'Data',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Card(
              color: const Color.fromARGB(255, 209, 207, 207),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    '${selectedDate.day.toString().padLeft(2, '0')}/${selectedDate.month.toString().padLeft(2, '0')}/${selectedDate.year}',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: CupertinoButton(
                color: Colors.black,
                child: const Text('Escolher data'),
                onPressed: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (BuildContext context) => SizedBox(
                      height: 250,
                      child: CupertinoDatePicker(
                        backgroundColor: Colors.white,
                        initialDateTime: selectedDate,
                        onDateTimeChanged: (DateTime newTime) {
                          setState(() {
                            selectedDate = newTime;
                          });
                        },
                        use24hFormat: true,
                        mode: CupertinoDatePickerMode.date,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              color: Colors.black,
              width: double.infinity,
              height: 40,
              child: const Center(
                child: Text(
                  'Hora',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Card(
              color: const Color.fromARGB(255, 209, 207, 207),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    '${selectedDate.hour.toString().padLeft(2, '0')}:${selectedDate.minute.toString().padLeft(2, '0')}',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: CupertinoButton(
                color: Colors.black,
                child: const Text('Escolher hora'),
                onPressed: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (BuildContext context) => SizedBox(
                      height: 250,
                      child: CupertinoDatePicker(
                        backgroundColor: Colors.white,
                        initialDateTime: selectedDate,
                        onDateTimeChanged: (DateTime newTime) {
                          setState(() {
                            selectedDate = newTime;
                          });
                        },
                        use24hFormat: true,
                        mode: CupertinoDatePickerMode.time,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
