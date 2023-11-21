import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_app2/screens/agendamentos.dart';
import 'package:flutter_app2/screens/TelainicialUniversidade.dart';

void main() {
  initializeDateFormatting('pt_BR', null);
  runApp(DateSelectionScreen());
}

class DateSelectionScreen extends StatefulWidget {
  @override
  _DateSelectionScreenState createState() => _DateSelectionScreenState();
}

class _DateSelectionScreenState extends State<DateSelectionScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  // Variáveis para o serviço e hora
  String _selectedService = 'Triagem Psicológica';
  DateTime _selectedTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 1, 162, 127),
          flexibleSpace: Center(
            child: Text(
              'Cadastrar Vagas',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => InitialScreenUniversidade()),
              );
            },
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 32,
                    color: Color.fromARGB(255, 1, 162, 127),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Selecione uma data',
                    style: TextStyle(
                      color: Color.fromARGB(255, 1, 162, 127),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              TableCalendar(
                locale: 'pt_BR',
                calendarFormat: _calendarFormat,
                focusedDay: _focusedDay,
                firstDay: DateTime(2000),
                lastDay: DateTime(2050),
                headerVisible: true,
                onFormatChanged: (format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                  });
                  // Manipule a seleção do dia aqui
                },
                headerStyle: HeaderStyle(
                  titleCentered: true,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.access_time,
                    size: 32,
                    color: Color.fromARGB(255, 1, 162, 127),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Horário',
                    style: TextStyle(
                      color: Color.fromARGB(255, 1, 162, 127),
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      // Implementar a seleção de hora aqui
                    },
                    child: Text(
                      '${_selectedTime.hour}:${_selectedTime.minute}',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 1, 162, 127),
                      ),
                    ),
                  ),
                ],
              ),
              DropdownButton<String>(
                value: _selectedService,
                items: <String>[
                  'Triagem Psicológica',
                  'Avaliação Psicológica/Psidodiagnóstico',
                  'Psicoterapia Individual',
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedService = newValue ?? '';
                  });
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Implemente a ação para o botão "Cadastrar Vaga" aqui
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Color.fromARGB(255, 1, 162, 127),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    'Cadastrar Vaga',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    color: Color.fromARGB(255, 1, 162, 127),
                    onPressed: () {
                      // Implementar a ação para o botão de calendário aqui
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.contacts),
                    color: Color.fromARGB(255, 1, 162, 127),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AgendamentosScreen()),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
