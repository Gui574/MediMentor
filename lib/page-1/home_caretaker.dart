import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/page-1/check_meds.dart';
import 'package:myapp/utils.dart';
import 'package:provider/provider.dart';

import 'add_med.dart';
import 'config_meds.dart';
import 'login_screen.dart';

class HomeCaretaker extends StatefulWidget {
  _HomeCaretakerPage createState() => _HomeCaretakerPage();
}

class _HomeCaretakerPage extends State<HomeCaretaker> {
  DateTime selectedDate = DateTime.now();
  late Timer _timer;
  Color _iconColor = Colors.white;

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
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
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
    // Get the medication data
    MedicationData medicationData = Provider.of<MedicationData>(context);

    // Check if any medications have not been taken
    List<Medication> missedMedications = medicationData.medications
        .where((medication) => medication.color == Colors.red)
        .toList();
    int missedMedicationCount = missedMedications.length;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              color: Color.fromARGB(255, 106, 144, 247),
              child: Row(
                children: [
                  Text(
                    'Panel',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
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
                    color: _iconColor,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Center(
                      child: Text(
                    'Welcome, Mr. José!',
                    style: TextStyle(
                      color: Color.fromARGB(255, 56, 55, 55),
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                  SizedBox(height: 5),
                ],
              ),
            ),
            if (missedMedicationCount > 0) ...[
              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 205, 217, 250),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.warning,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Center(
                          child: Text(
                            'Mr. António missed  $missedMedicationCount medications today! Go to Check Medications to view them',
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 0, 0),
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ] else ...[
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.warning,
                      color: Color.fromARGB(255, 91, 221, 40),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'There are no new notifications',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CheckMedsPage()),
                        );
                      },
                      child: Text(
                        'Check Medications   ->',
                        style: TextStyle(
                          fontSize: 20,
                          color: missedMedicationCount > 0
                              ? Colors.white
                              : Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(350, 70),
                        padding: EdgeInsets.all(16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: missedMedicationCount > 0
                            ? Colors.red
                            : Colors.green,
                      ),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ConfigMedsPage()),
                        );
                      },
                      child: Text('Configurate Medications   ->',
                          style: TextStyle(fontSize: 20)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 106, 144, 247),
                        fixedSize: Size(350, 70), // sets the minimum size
                        padding: EdgeInsets.all(16), // sets the padding
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              20), // sets the border radius
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
          ],
        ),
      ),
    );
  }
}
