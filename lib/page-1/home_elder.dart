import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'add_med.dart';
import 'login_screen.dart';

class TimerModel extends ChangeNotifier {
  Timer _timer = Timer.periodic(Duration(seconds: 1), (timer) {
    // Your timer callback function here
  });
  int _timerValue = 0;

  int get timerValue => _timerValue;

  TimerModel() {
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      _timerValue = _timerValue + 5;

      notifyListeners(); // Notify listeners that the timer has reached the specific point
    });
  }
}

class HomeElder extends StatefulWidget {
  HomeElder({
    Key? key,
  }) : super(key: key);

  _HomeElderState createState() => _HomeElderState();
}

class _HomeElderState extends State<HomeElder> {
  DateTime selectedDate = DateTime.now();
  Color iconColor = Colors.yellow;
  late Timer _timer;

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
    // Format the selected date in the desired format

    final DateFormat dateFormat =
        DateFormat('EEEE, dd \'de\' MMMM \'de\' y', 'pt_BR');
    String formattedDate = dateFormat.format(selectedDate);

    setState(() {
      selectedDate =
          DateTime(selectedDate.year, selectedDate.month, selectedDate.day);
    });

    void changeColor(context, Medication med) {
      setState(() {
        med.color = Colors.red;
      });
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              color: Color.fromARGB(255, 90, 89, 89),
              child: Row(
                children: [
                  Text(
                    'Painel',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      icon: Icon(Icons.logout),
                      color: (Colors.white)),
                ],
              ),
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
              child: Consumer2<MedicationData, TimerModel>(
                  builder: (context, medicationData, timermodel, _) {
                final filteredMeds = medicationData.medications.where((med) =>
                    med.date.day == selectedDate.day &&
                    med.date.month == selectedDate.month &&
                    med.date.year == selectedDate.year);

                return ListView.builder(
                  itemCount: filteredMeds.length,
                  itemBuilder: (BuildContext context, int index) {
                    final medication = filteredMeds.elementAt(index);
                    int match = -1;

                    for (int i = 0;
                        i < medicationData.medications.length;
                        i++) {
                      if (medication.equals(medicationData.medications[i])) {
                        match = i;
                      }
                    }

                    //int count = Provider.of<int>(context);

                    return SizedBox(
                      height: 120,
                      child: Card(
                        color: Colors.transparent,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      medication.name,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'Dose: ${medication.dosage}',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'Hora: ${medication.time.hour}:${medication.time.minute}',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (medicationData.medications[match].color ==
                                      Colors.yellow) {
                                    medicationData.medications[match].color =
                                        Colors.green;
                                  } else if (medicationData
                                          .medications[match].color ==
                                      Colors.green) {
                                    medicationData.medications[match].color =
                                        Colors.yellow;
                                  }
                                });
                              },
                              icon: Icon(Icons.check_circle_outline),
                              color: medicationData.medications[match].color,
                              iconSize: 50.0,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 70,
              color: Color.fromARGB(255, 90, 89, 89),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(Icons.home, color: Colors.white),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.settings, color: Colors.white),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.search, color: Colors.white),
                    onPressed: () {},
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
