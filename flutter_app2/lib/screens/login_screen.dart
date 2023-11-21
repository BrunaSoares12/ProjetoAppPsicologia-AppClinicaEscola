import 'package:flutter/material.dart';
import 'package:flutter_app2/screens/TelainicialUniversidade.dart';

void main() {
  runApp(LoginScreen());
}

class LoginScreen extends StatelessWidget {
  String email = "";
  String password = "";

  void login(BuildContext context) {
    if (email.isNotEmpty && password.isNotEmpty) {
      print("Login bem-sucedido");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => InitialScreenUniversidade()),
      );
    } else {
      print("Preencha todos os campos.");
    }
  }

  void resetPassword() {
    print("Solicitação de redefinição de senha enviada para: $email");
  }

  void createAccount() {
    if (email.isNotEmpty && password.isNotEmpty) {
      print("Conta criada com sucesso para o email: $email");
    } else {
      print("Preencha todos os campos para criar uma conta.");
    }
  }

  void registerUniversity() {
    // Implementar ação de registro de universidade
    print("Cadastrar Universidade");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/img/icone.png',
                  width: 100,
                  height: 100,
                ),
                SizedBox(height: 10),
                Text(
                  "AgendaPsi",
                  style: TextStyle(
                    color: Color.fromARGB(255, 1, 162, 127),
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.mail,
                          color: Color.fromARGB(255, 1, 162, 127),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 17, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            onChanged: (value) {
                              email = value;
                            },
                            decoration: InputDecoration(
                              hintText: "Email",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.lock,
                          color: Color.fromARGB(255, 1, 162, 127),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            onChanged: (value) {
                              password = value;
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "Senha",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => login(context),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 1, 162, 127),
                    ),
                    minimumSize: MaterialStateProperty.all(Size(200, 48)),
                  ),
                  child: Text(
                    "Acessar",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: resetPassword,
                  child: Text(
                    "Esqueci a senha",
                    style: TextStyle(
                      color: Color.fromARGB(255, 1, 162, 127),
                    ),
                  ),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: registerUniversity,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 1, 162, 127),
                    ),
                    minimumSize: MaterialStateProperty.all(Size(200, 48)),
                  ),
                  child: Text(
                    "Cadastrar Universidade",
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
