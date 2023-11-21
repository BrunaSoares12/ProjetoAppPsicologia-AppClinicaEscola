import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_app2/screens/TelainicialUniversidade.dart';
import 'package:flutter_app2/screens/DetalhesAgendamento.dart';
import 'package:flutter_app2/screens/cadastrarVaga.dart';

class AgendamentosScreen extends StatefulWidget {
  @override
  _AgendamentosScreenState createState() => _AgendamentosScreenState();
}

class _AgendamentosScreenState extends State<AgendamentosScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  // Variables for patient appointments
  DateTime _patient1Date = DateTime.now();
  DateTime _patient2Date = DateTime.now();
  DateTime _patient3Date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 1, 162, 127),
          flexibleSpace: Center(
            child: Text(
              'Agendamentos',
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
                  // Handle day selection here
                },
                headerStyle: HeaderStyle(
                  titleCentered: true,
                ),
              ),
              AppointmentField("Paciente 1", _patient1Date),
              AppointmentField("Paciente 2", _patient2Date),
              AppointmentField("Paciente 3", _patient3Date),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    color: Color.fromARGB(255, 1, 162, 127),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DateSelectionScreen()),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.contacts),
                    color: Color.fromARGB(255, 1, 162, 127),
                    onPressed: () {
                      // Implement the contact button action here
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

class AppointmentField extends StatefulWidget {
  final String title;
  final DateTime appointmentDate;

  AppointmentField(this.title, this.appointmentDate);

  @override
  _AppointmentFieldState createState() => _AppointmentFieldState();
}

class _AppointmentFieldState extends State<AppointmentField> {
  bool showDetails = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
              widget.title,
              style: TextStyle(
                color: Color.fromARGB(255, 1, 162, 127),
                fontSize: 16,
              ),
            ),
            SizedBox(width: 8),
            GestureDetector(
              onTap: () {
                // Implement appointment time selection here
              },
              child: Text(
                '${widget.appointmentDate.hour}:${widget.appointmentDate.minute}',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 1, 162, 127),
                ),
              ),
            ),
            SizedBox(width: 8),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuestionarioScreen()),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Color.fromARGB(255, 246, 247, 246)),
              ),
              child: Text(
                'Ver mais',
                style: TextStyle(
                  color: Color.fromARGB(255, 1, 162, 127),
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
