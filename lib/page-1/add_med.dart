import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/page-1/config_meds.dart';
import 'package:provider/provider.dart';

import 'home_caretaker.dart';

class Medication {
  final String name;
  final String dosage;
  final DateTime date;
  final File? image;
  final TimeOfDay time;
  Color color;

  Medication(
      {required this.name,
      required this.dosage,
      required this.date,
      required this.image,
      required this.color,
      required this.time});

  bool equals(Medication med) {
    if (name == med.name &&
        dosage == med.dosage &&
        date == med.date &&
        image == med.image) {
      return true;
    } else {
      return false;
    }
  }

  String get imagePath => image!.path;
}

class MedicationData extends ChangeNotifier {
  List<Medication> _medications = [];

  List<Medication> get medications => _medications;

  void addMedication(Medication medication) {
    _medications.add(medication);
    notifyListeners();
  }
}

class AddMedsPage extends StatefulWidget {
  @override
  _AddMedsPageState createState() => _AddMedsPageState();
}

class _AddMedsPageState extends State<AddMedsPage> {
  final _formKey = GlobalKey<FormState>();
  String? _medicationName;
  String? _medicationDosage;
  DateTime? _selectedDate;
  File? _selectedImage;
  TimeOfDay? _selectedTime;
  Color? _medicationColor = Colors.yellow;

  void _addMedication(BuildContext context) {
    final medicationData = Provider.of<MedicationData>(context, listen: false);

    final medication = Medication(
        name: _medicationName!,
        dosage: _medicationDosage!,
        date: _selectedDate!,
        color: _medicationColor!,
        image: _selectedImage,
        time: _selectedTime!);

    medicationData.addMedication(medication);

    // Navigate back to HomeElder page
    Navigator.pop(context);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child ?? Container(),
        );
      },
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  Future<void> _selectImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  Widget _buildImagePreview() {
    if (_selectedImage == null) {
      return Container();
    } else {
      return Container(
        height: 200,
        width: 200,
        child: Image.file(_selectedImage!),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 90, 89, 89),
            title: Text('Adicionar Medicação'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Nome da Medicação',
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255),
                            width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255),
                            width: 1.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor introduza o nome';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _medicationName = value;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Dose',
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255),
                            width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255),
                            width: 1.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor introduza a dose';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _medicationDosage = value;
                    },
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => _selectTime(context),
                    child: Text(_selectedTime == null
                        ? 'Selecione a hora de toma'
                        : 'Hora de Toma: ${_selectedTime!.hour}:${_selectedTime!.minute}'),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => _selectDate(context),
                    child: Text(_selectedDate == null
                        ? 'Selecione a data de toma'
                        : 'Data de toma: ${_selectedDate!.day}-${_selectedDate!.month}-${_selectedDate!.year}'),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _selectImage,
                    child: Text(_selectedImage == null
                        ? 'Selecione a imagem da medicação'
                        : 'Imagem selecionada'),
                  ),
                  SizedBox(height: 10),
                  _buildImagePreview(),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        // save medication info to database

                        _addMedication(context);
                      }
                    },
                    child: Text('Guardar'),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 60,
            color: Color.fromARGB(255, 90, 89, 89),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.home, color: Colors.white),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeCaretaker()));
                  },
                ),
                IconButton(
                  icon: Icon(Icons.settings, color: Colors.white),
                  onPressed: () {
                    // do something
                  },
                ),
                IconButton(
                  icon: Icon(Icons.search, color: Colors.white),
                  onPressed: () {
                    // do something
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
