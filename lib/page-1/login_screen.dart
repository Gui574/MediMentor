import 'package:flutter/material.dart';
import 'package:myapp/page-1/home_caretaker.dart';
import 'package:myapp/page-1/home_elder.dart';
import 'login_logic.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
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
              const Center(
                child: Image(
                  image: AssetImage('assets/page-1/images/HomeImage.png'),
                  height: 250,
                  width: 200,
                ),
              ),
              const SizedBox(height: 20),

              // Welcome text
              const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Bem-Vindo',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Input boxes
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        hintText: 'Enter your username ',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter your Password',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
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
                      minimumSize:
                          MaterialStateProperty.all(const Size(150, 50)),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 106, 144, 247)),
                    ),
                    onPressed: () {
                      if (_emailController.text.trim() == 'teste1' &&
                          _passwordController.text.trim() == 'teste1') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeCaretaker()),
                        );
                      } else if (contains(_emailController.text.trim(),
                          _passwordController.text.trim())) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeElder()),
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Error'),
                              content: const Text('Wrong e-mail or password'),
                              actions: <Widget>[
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 106, 144, 247)),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Text('Login'),
                  ),
                  const SizedBox(width: 20),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(150, 50),
                    ),
                    child: const Text('Sign Up'),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Logo at the bottom
              const Expanded(
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
