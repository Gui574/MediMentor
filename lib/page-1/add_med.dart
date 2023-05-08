import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/page-1/config_meds.dart';

class Medication {
  final String name;
  final String dosage;
  final DateTime date;
  final File? image;
  final TimeOfDay time;

  Medication(
      {required this.name,
      required this.dosage,
      required this.date,
      required this.image,
      required this.time});
  String get imagePath => image!.path;
}

class AddMedsPage extends StatefulWidget {
  final List<Medication> medicationData;

  AddMedsPage({required this.medicationData});

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
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 90, 89, 89),
            title: Text('Add Medication Info'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Medication Name',
                        border: OutlineInputBorder()),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter medication name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _medicationName = value;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Medication Dosage',
                        border: OutlineInputBorder()),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter medication dosage';
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
                        ? 'Select Medication Hour'
                        : 'Medication Hour: ${_selectedTime!.hour}:${_selectedTime!.minute}'),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => _selectDate(context),
                    child: Text(_selectedDate == null
                        ? 'Select Medication Date'
                        : 'Medication Date: ${_selectedDate!.day}-${_selectedDate!.month}-${_selectedDate!.year}'),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _selectImage,
                    child: Text(_selectedImage == null
                        ? 'Select Medication Image'
                        : 'Medication Image Selected'),
                  ),
                  SizedBox(height: 10),
                  _buildImagePreview(),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        // save medication info to database

                        widget.medicationData.add(Medication(
                            name: _medicationName!,
                            dosage: _medicationDosage!,
                            date: _selectedDate!,
                            image: _selectedImage,
                            time: _selectedTime!));

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ConfigMedsPage(
                                    medicationData: widget.medicationData,
                                  )),
                        ).then((_) {
                          setState(() {});
                        });
                      }
                    },
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
            color: Color.fromARGB(255, 90, 89, 89),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.home, color: Colors.white),
                  onPressed: () {
                    // do something
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
