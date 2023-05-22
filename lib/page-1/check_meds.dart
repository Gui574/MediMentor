import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:myapp/page-1/home_caretaker.dart';
import 'package:myapp/utils.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import 'add_med.dart';
import 'login_screen.dart';

class CheckMedsPage extends StatefulWidget {
  @override
  _CheckMedsPageState createState() => _CheckMedsPageState();
}

class _CheckMedsPageState extends State<CheckMedsPage> {
  DateTime selectedDate = DateTime.now();
  late Timer _timer;
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();

  void updateColors() {
    setState(() {
      final medicationData =
          Provider.of<MedicationData>(context, listen: false);
      final nowDate = DateTime.now();

      for (Medication med in medicationData.medications) {
        DateTime medicationDateTime = DateTime(
          med.date.year,
          med.date.month,
          med.date.day,
          med.time.hour,
          med.time.minute,
        );
        final difference = nowDate.difference(medicationDateTime);

        if (difference > Duration(seconds: 30)) {
          if (med.color == Colors.yellow) {
            med.color = Colors.red;
          }
        }
      }
    });
  }

  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 60), (timer) {
      updateColors();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    final DateFormat dateFormat = DateFormat('EEEE, dd MMMM y', 'en_US');

    String formattedDate = dateFormat.format(selectedDate);

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              color: Color.fromARGB(255, 106, 144, 247),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    'Check Medications',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Confirmation'),
                              content: Text('Are you sure you want to logout?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    // Perform action on confirmation
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginScreen())); // Close the dialog
                                  },
                                  child: Text('Yes'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    // Perform action on cancel
                                    Navigator.pop(context); // Close the dialog
                                  },
                                  child: Text('No'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      icon: Icon(Icons.logout),
                      color: Colors.white),
                ],
              ),
            ),
            TableCalendar(
              calendarFormat: _calendarFormat,
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
              firstDay: DateTime.utc(2023, 5, 1),
              lastDay: DateTime.utc(2024, 3, 14),
              focusedDay: selectedDate,
              selectedDayPredicate: (day) => isSameDay(selectedDate, day),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  selectedDate = selectedDay;
                  //_focusedDay = selectedDay;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                formattedDate,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Consumer<MedicationData>(
                  builder: (context, medicationData, _) {
                final filteredMeds = medicationData.medications.where((med) =>
                    med.date.day == selectedDate.day &&
                    med.date.month == selectedDate.month &&
                    med.date.year == selectedDate.year);
                if (filteredMeds.isEmpty) {
                  return Center(
                    child: Text(
                      'No medications to display',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: filteredMeds.length,
                    itemBuilder: (BuildContext context, int index) {
                      final medication = filteredMeds.elementAt(index);
                      String taken = "NOT TAKEN YET";
                      if (medication.color == Colors.green) {
                        taken = "TAKEN";
                      } else if (medication.color == Colors.yellow) {
                        taken = "NOT TAKEN YET";
                      } else if (medication.color == Colors.red) {
                        taken = "MISSED";
                      }

                      return SizedBox(
                        height: 120,
                        child: Card(
                          color: Color.fromARGB(255, 106, 144, 247),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.file(
                                    medication.image!,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        medication.name,
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 68, 67, 67),
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Dosage: ${medication.dosage}',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color:
                                              Color.fromARGB(255, 71, 71, 71),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Time: ${medication.time.hour}:${medication.time.minute}',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color:
                                              Color.fromARGB(255, 78, 77, 77),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  minimumSize:
                                      MaterialStateProperty.all(Size(100, 40)),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          medication.color),
                                ),
                                onPressed: () {},
                                child: Text(taken),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              }),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 70,
              color: Color.fromARGB(255, 106, 144, 247),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                      // do something
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
          ],
        ),
      ),
    );
  }
}
