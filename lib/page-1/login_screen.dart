import 'package:flutter/material.dart';
import 'package:myapp/page-1/config_meds.dart';
import 'package:myapp/page-1/home_caretaker.dart';
import 'package:myapp/page-1/home_elder.dart';
import 'add_med.dart';
import 'login_logic.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({
    Key? key,
  }) : super(key: key);

  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Centered and resized top image
              Center(
                child: Image(
                  image: AssetImage('assets/page-1/images/HomeImage.png'),
                  height: 250,
                  width: 200,
                ),
              ),
              SizedBox(height: 20),

              // Welcome text
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Bem-Vindo',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 10),

              // Input boxes
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Introduza o Email',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Introduza a sua Password',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Esquece Password?',
                        style: TextStyle(
                            color: Color.fromARGB(255, 106, 144, 247)),
                      ),
                    ),
                  ],
                ),
              ),

              // Login and register buttons
              // Login and register buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(150, 50)),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 106, 144, 247)),
                    ),
                    onPressed: () {
                      String result = loginLogic(
                          _emailController.text, _passwordController.text);
                      if (result == "caretaker") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeCaretaker()),
                        );
                      } else if (result == "elder") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeElder()),
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Error'),
                              content: Text('Wrong e-mail or password'),
                              actions: <Widget>[
                                ElevatedButton(
                                  child: Text('OK'),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Color.fromARGB(255, 106, 144, 247)),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: Text('Login'),
                  ),
                  SizedBox(width: 20),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(150, 50),
                    ),
                    child: Text('Sign Up'),
                  ),
                ],
              ),

              SizedBox(height: 20),

              // Logo at the bottom
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Image(
                    image: AssetImage('assets/page-1/images/logo.png'),
                    height: 100,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
