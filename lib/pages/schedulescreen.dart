import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  DateTime _selectedDate = DateTime.now(); //data selecionada
  DateTime _today = DateTime.now(); // data em foco no calendário

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

  // Função para criar cabeçalhos de seção
  Widget _buildSectionHeader(String title) {
    return Container(
      color: Colors.black,
      width: double.infinity,
      height: 40,
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  // Função para criar cartões de informação
  Widget _buildInfoCard({required String content}) {
    return Card(
      color: const Color.fromARGB(255, 209, 207, 207),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          content,
          style: const TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

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
            _buildSectionHeader('Serviço'),
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
            _buildInfoCard(
              content: selectedService == null
                  ? 'Nenhum serviço selecionado'
                  : 'Serviço selecionado: $selectedService',
            ),
            const SizedBox(height: 20),
            _buildSectionHeader('Profissional'),
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
            _buildInfoCard(
              content: selectedProfessional == null
                  ? 'Nenhum profissional selecionado'
                  : 'Profissional selecionado: $selectedProfessional',
            ),
            const SizedBox(height: 20),
            _buildSectionHeader('Data'),
            //-----------------------------------------------//
            TableCalendar(
              locale: "pt_BR",
              focusedDay: _today,
              firstDay: DateTime.now(),
              lastDay: DateTime.now().add(
                const Duration(days: 365),
              ),
              // Função usada para determinar se um dia está selecionado
              selectedDayPredicate: (day) => isSameDay(_selectedDate, day),
              //  Callback que dispara ao selecionar uma data
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDate = selectedDay;
                  _today = focusedDay;
                });
              },
              calendarStyle: const CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  weekendTextStyle: TextStyle(color: Colors.red)),
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
              ),
            ),
            _buildInfoCard(
              content: 'Data selecionada: '
                  '${_selectedDate.day.toString().padLeft(2, '0')}/'
                  '${_selectedDate.month.toString().padLeft(2, '0')}/'
                  '${_selectedDate.year}',
            ),
          ],
        ),
      ),
    );
  }
}
