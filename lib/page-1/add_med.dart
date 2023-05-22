import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/page-1/config_meds.dart';
import 'package:provider/provider.dart';

import 'check_meds.dart';
import 'home_caretaker.dart';

class Medication {
  final String name;
  final String dosage;
  final DateTime date;
  final File? image;
  final TimeOfDay time;
  Color color;

  Medication({
    required this.name,
    required this.dosage,
    required this.date,
    required this.image,
    required this.time,
    required this.color,
  });

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

  String get imagePath => image?.path ?? '';
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
  final DateTime selectedDate;

  AddMedsPage({required this.selectedDate});
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
  int _numberOfDays = 1;

  void _addMedication(BuildContext context, DateTime date) {
    final medicationData = Provider.of<MedicationData>(context, listen: false);
    final nextDays = List<DateTime>.generate(
      _numberOfDays,
      (index) => widget.selectedDate!.add(Duration(days: index + 1)),
    );

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final nextMedication = Medication(
        name: _medicationName!,
        dosage: _medicationDosage!,
        date: widget.selectedDate,
        color: Colors.yellow,
        image: _selectedImage,
        time: _selectedTime!,
      );
      medicationData.addMedication(nextMedication);

      for (final date in nextDays) {
        final nextMedication = Medication(
          name: _medicationName!,
          dosage: _medicationDosage!,
          date: date,
          color: Colors.yellow,
          image: _selectedImage,
          time: _selectedTime!,
        );
        medicationData.addMedication(nextMedication);
      }

      // Navigate back to HomeElder page
      Navigator.pop(context);
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
      return InkWell(
        onTap: _selectImage,
        child: Container(
          height: 200,
          width: 200,
          color: Colors.grey,
          child: Icon(
            Icons.add,
            size: 50,
            color: Colors.white,
          ),
        ),
      );
    } else {
      return Container(
        height: 200,
        width: 200,
        child: Image.file(_selectedImage!),
      );
    }
  }

  List<int> _hoursList = List<int>.generate(24, (index) => index);

  Widget _buildTimeButton(int hour) {
    final isSelected = _selectedTime?.hour == hour;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _selectedTime = TimeOfDay(hour: hour, minute: 0);
          });
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            isSelected ? Color.fromARGB(255, 106, 144, 247) : Colors.grey,
          ),
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          ),
          textStyle: MaterialStateProperty.all(
            TextStyle(fontSize: 18.0),
          ),
        ),
        child: Text('$hour:00'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 106, 144, 247),
              title: Text('Add Medication'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    _buildImagePreview(),
                    SizedBox(height: 40),
                    TextFormField(
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      decoration: InputDecoration(
                        labelText: 'Medication Name',
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 0, 0, 0), width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 0, 0, 0), width: 1.0),
                        ),
                      ),
                      onChanged: (value) {
                        _medicationName = value;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      decoration: InputDecoration(
                        labelText: 'Dosage',
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 0, 0, 0), width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 0, 0, 0), width: 1.0),
                        ),
                      ),
                      onChanged: (value) {
                        _medicationDosage = value;
                      },
                    ),
                    SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Row(
                          children: _hoursList
                              .map((hour) => _buildTimeButton(hour))
                              .toList(),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Number of days: ',
                          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                        SizedBox(width: 10),
                        DropdownButton<int>(
                          value: _numberOfDays,
                          onChanged: (value) {
                            setState(() {
                              _numberOfDays = value!;
                            });
                          },
                          items: List.generate(10, (index) {
                            final days = index + 1;
                            return DropdownMenuItem<int>(
                              value: days,
                              child: Text(days.toString()),
                            );
                          }),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        if (_medicationName == null ||
                            _medicationDosage == null ||
                            _selectedTime == null ||
                            _selectedImage == null ||
                            _numberOfDays == null) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Error'),
                                content: Text(
                                    'Por favor enter all the fields, including an image'),
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
                          return;
                        } else {
                          _addMedication(context, widget.selectedDate);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Medication added successfully'),
                              backgroundColor: Colors.green,
                              duration: Duration(seconds: 2),
                            ),
                          );
                        }
                        // save medication info to database
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 106, 144, 247)),
                      child: Text('Save'),
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
              color: Color.fromARGB(255, 106, 144, 247),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(Icons.home, color: Colors.white),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeCaretaker(),
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.fact_check, color: Colors.white),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CheckMedsPage(),
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.account_box, color: Colors.white),
                    onPressed: () {
                      // do something
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
