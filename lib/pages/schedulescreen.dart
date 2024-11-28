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

  // Lista de horários disponíveis
  final List<String> timeSlots = [
    "08:00 - 09:00",
    "09:00 - 10:00",
    "10:00 - 11:00",
    "11:00 - 12:00",
    "14:00 - 15:00",
    "15:00 - 16:00",
    "16:00 - 17:00",
    "17:00 - 18:00",
  ];

  //Horário selecionado
  String selectedTimeSlot = '';

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
                todayDecoration: BoxDecoration(),
                todayTextStyle: TextStyle(fontWeight: FontWeight.bold),
                selectedDecoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                selectedTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                weekendTextStyle: TextStyle(color: Colors.red),
              ),
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
            _buildSectionHeader('Horário'),
            const SizedBox(height: 20),
            SizedBox(
              height: 250, // Define uma altura fixa para o Expanded
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Número de colunas
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 2.5, // Proporção largura/altura
                    ),
                    itemCount: timeSlots.length,
                    itemBuilder: (context, index) {
                      final timeSlot = timeSlots[index];
                      final isSelected = timeSlot == selectedTimeSlot;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTimeSlot = timeSlot;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.blue : Colors.grey[200],
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: isSelected ? Colors.blue : Colors.grey,
                              width: 2,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            timeSlot,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
