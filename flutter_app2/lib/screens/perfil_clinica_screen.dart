import 'package:flutter/material.dart';
import 'package:flutter_app2/widgets/profile_text_field.dart';
import 'package:flutter_app2/screens/TelainicialUniversidade.dart';

void main() {
  runApp(PerfilUniversidade());
}

class PerfilUniversidade extends StatefulWidget {
  @override
  _PerfilUniversidadeState createState() => _PerfilUniversidadeState();
}

class _PerfilUniversidadeState extends State<PerfilUniversidade> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String nome = "";
  String telefone = "";
  String email = "";
  String endereco = "";
  String genero = "Feminino";
  String novaSenha = "";
  String confirmarSenha = "";
  String cnpj = "";
  String nomeResponsavel = "";
  String cpfResponsavel = "";

  void updateProfile() {
    if (nome.isNotEmpty &&
        telefone.isNotEmpty &&
        email.isNotEmpty &&
        endereco.isNotEmpty &&
        genero.isNotEmpty &&
        novaSenha.isNotEmpty &&
        confirmarSenha.isNotEmpty &&
        cnpj.isNotEmpty &&
        nomeResponsavel.isNotEmpty &&
        cpfResponsavel.isNotEmpty) {
      print("Perfil atualizado com sucesso");
    } else {
      print("Preencha todos os campos.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 1, 162, 127),
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
          ),
          title: Text(
            "Perfil da Clinica",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text("Perfil da Clinica"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PerfilUniversidade(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text("Voltar Tela Inicial"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InitialScreenUniversidade()));
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                ProfileTextField(
                  label: "Nome da Empresa",
                  onChanged: (value) {
                    nome = value;
                  },
                ),
                ProfileTextField(
                  label: "Telefone para contato:",
                  onChanged: (value) {
                    telefone = value;
                  },
                ),
                ProfileTextField(
                  label: "Email",
                  onChanged: (value) {
                    email = value;
                  },
                ),
                ProfileTextField(
                  label: "Endereço",
                  onChanged: (value) {
                    endereco = value;
                  },
                ),
                ProfileTextField(
                  label: "CNPJ",
                  onChanged: (value) {
                    cnpj = value;
                  },
                ),
                ProfileTextField(
                  label: "Nome do Responsável",
                  onChanged: (value) {
                    nomeResponsavel = value;
                  },
                ),
                ProfileTextField(
                  label: "CPF do Responsável",
                  onChanged: (value) {
                    cpfResponsavel = value;
                  },
                ),
                ProfileTextField(
                  label: "Nova Senha",
                  onChanged: (value) {
                    novaSenha = value;
                  },
                  obscureText: true,
                ),
                ProfileTextField(
                  label: "Confirmar Senha",
                  onChanged: (value) {
                    confirmarSenha = value;
                  },
                  obscureText: true,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: updateProfile,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 1, 162, 127)),
                    minimumSize: MaterialStateProperty.all(Size(200, 48)),
                  ),
                  child: Text(
                    "Atualizar",
                    style: TextStyle(
                      color: Colors.white,
                    ),
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

class PerfilPaciente extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil do Paciente"),
      ),
      body: Center(
        child: Text("Conteúdo do Perfil do Paciente"),
      ),
    );
  }
}

class ProfileTextField extends StatelessWidget {
  final String label;
  final ValueChanged<String> onChanged;
  final bool obscureText;

  ProfileTextField({
    required this.label,
    required this.onChanged,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: const Color(0xFF5E5E5E),
            fontSize: 15,
            fontFamily: 'Scada',
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 5),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            onChanged: onChanged,
            obscureText: obscureText,
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
