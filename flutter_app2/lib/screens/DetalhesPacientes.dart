import 'package:flutter/material.dart';
import 'package:flutter_app2/screens/TelainicialUniversidade.dart';

class MinhasConsultasScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final textColor = const Color(0xFF5E5E5E);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 1, 162, 127),
        flexibleSpace: Center(
          child: Text("Agendamentos",
              style: TextStyle(fontSize: 24, color: Colors.white)),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => InitialScreenUniversidade()),
              );
            }),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nome: Paciente 1",
              style: TextStyle(fontSize: 20, color: textColor),
            ),
            SizedBox(height: 20),
            Text(
              "Tipo: Psicoterapia Individual",
              style: TextStyle(fontSize: 16, color: textColor),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Icon(Icons.date_range, color: Color.fromARGB(255, 1, 162, 127)),
                SizedBox(width: 8),
                Text("Data: 25/11/2023", style: TextStyle(color: textColor)),
                SizedBox(width: 20),
                Icon(Icons.access_time,
                    color: Color.fromARGB(255, 1, 162, 127)),
                SizedBox(width: 8),
                Text("Horário: 10:00 AM", style: TextStyle(color: textColor)),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Icon(Icons.call, color: Color.fromARGB(255, 1, 162, 127)),
                SizedBox(width: 8),
                Text("Fone: (XX) XXXXX-XXXX",
                    style: TextStyle(color: textColor)),
              ],
            ),
            SizedBox(height: 10),
            Text(
              "Sintomas:",
              style: TextStyle(fontSize: 16, color: textColor),
            ),
            for (int i = 0; i < 5; i++)
              TextField(
                decoration: InputDecoration(),
              ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
