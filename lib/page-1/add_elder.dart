import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:googleapis/classroom/v1.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:myapp/page-1/home_caretaker.dart';
import 'package:myapp/page-1/login_logic.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import 'add_med.dart';
import 'check_meds.dart';
import 'login_screen.dart';

String selectedElder = '';

class Elder {
  final String name;
  final int age;
  final String gender;
  final File? image;
  String username;
  String password;

  Elder({
    required this.name,
    required this.age,
    required this.gender,
    required this.image,
    required this.username,
    required this.password,
  });

  String get imagePath => image?.path ?? '';
}

class ElderData extends ChangeNotifier {
  final List<Elder> _elders = [];
  List<Elder> get elders => _elders;

  void addElder(Elder elder) {
    _elders.add(elder);
    notifyListeners();
  }
}

class Add_ElderPage extends StatefulWidget {
  @override
  _Add_ElderPageState createState() => _Add_ElderPageState();
}

class _Add_ElderPageState extends State<Add_ElderPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ImagePicker _imagePicker = ImagePicker();
  File? _selectedImage;

  void _addElder(BuildContext context) {
    String name = _nameController.text.trim();
    int age = int.tryParse(_ageController.text.trim()) ?? 0;
    String gender = _genderController.text.trim();
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    if (name.isNotEmpty &&
        age > 0 &&
        gender.isNotEmpty &&
        _selectedImage != null) {
      //String imagePath = _selectedImage!.path;
      Elder elder = Elder(
          name: name,
          age: age,
          gender: gender,
          image: _selectedImage,
          username: username,
          password: password);
      Provider.of<ElderData>(context, listen: false).addElder(elder);
      Login login = Login(username, password);
      logins.add(login);
      Navigator.pop(context); // Go back to the previous page
    }
  }

  Future<void> _selectImage() async {
    final XFile? image =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 106, 144, 247),
        title: Text('Add Elder'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _genderController,
              decoration: InputDecoration(labelText: 'Gender'),
            ),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _selectImage,
              child: Text('Select Image'),
            ),
            SizedBox(height: 16.0),
            if (_selectedImage != null) ...[
              Image.file(
                _selectedImage!,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16.0),
            ],
            ElevatedButton(
              onPressed: () {
                if (_nameController.text.trim() == null ||
                    int.tryParse(_ageController.text.trim()) == null ||
                    _genderController.text.trim() == null ||
                    _selectedImage == null ||
                    _usernameController.text.trim() == null ||
                    _passwordController.text.trim() == null) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Error'),
                        content: const Text(
                            'Please enter all the fields, including an image'),
                        actions: <Widget>[
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 106, 144, 247)),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                  return;
                } else {
                  _addElder(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Elder profile created successfully'),
                      backgroundColor: Colors.green,
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              },
              child: Text('Add Elder'),
            ),
          ],
        ),
      ),
    );
  }
}
