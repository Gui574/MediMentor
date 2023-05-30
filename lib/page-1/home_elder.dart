import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'add_med.dart';
import 'login_screen.dart';

class TimerModel extends ChangeNotifier {
  Timer _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
    // Your timer callback function here
  });
  int _timerValue = 0;

  int get timerValue => _timerValue;

  TimerModel() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      _timerValue = _timerValue + 5;

      notifyListeners(); // Notify listeners that the timer has reached the specific point
    });
  }
}

class HomeElder extends StatefulWidget {
  const HomeElder({
    Key? key,
  }) : super(key: key);

  @override
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

        if (difference > const Duration(seconds: 30)) {
          if (med.color == Colors.yellow) {
            med.color = Colors.red;
          }
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 60), (timer) {
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

    final DateFormat dateFormat = DateFormat('EEEE, dd MMMM y', 'en_US');

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
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              color: const Color.fromARGB(255, 106, 144, 247),
              child: Row(
                children: [
                  const Text(
                    'Panel',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Confirmation'),
                              content: const Text('Are you sure you want to logout?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    // Perform action on confirmation
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginScreen())); // Close the dialog
                                  },
                                  child: const Text('Yes'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    // Perform action on cancel
                                    Navigator.pop(context); // Close the dialog
                                  },
                                  child: const Text('No'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      icon: const Icon(Icons.logout),
                      color: (Colors.white)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                formattedDate,
                style: const TextStyle(
                  color: Color.fromARGB(255, 53, 53, 53),
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

                if (filteredMeds.isEmpty) {
                  return const Center(
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
                          color: const Color.fromARGB(255, 142, 167, 236),
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
                                        style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 56, 56, 56),
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        'Dosage: ${medication.dosage}',
                                        style: const TextStyle(
                                          fontSize: 20,
                                          color:
                                              Color.fromARGB(255, 53, 52, 52),
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        'Time: ${medication.time.hour}:${medication.time.minute}',
                                        style: const TextStyle(
                                          fontSize: 20,
                                          color:
                                              Color.fromARGB(255, 53, 52, 52),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              ElevatedButton.icon(
                                onPressed: () {
                                  setState(() {
                                    if (medicationData
                                            .medications[match].color ==
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
                                icon: Icon(
                                  medicationData.medications[match].color ==
                                          Colors.red
                                      ? Icons.dangerous
                                      : medicationData
                                                  .medications[match].color ==
                                              Colors.yellow
                                          ? Icons.timer_outlined
                                          : Icons.check_box,
                                  color:
                                      medicationData.medications[match].color,
                                  size: 50.0,
                                ),
                                label: Text(
                                  medicationData.medications[match].color ==
                                          Colors.red
                                      ? 'MISSED!'
                                      : medicationData
                                                  .medications[match].color ==
                                              Colors.green
                                          ? 'TAKEN'
                                          : 'TO TAKE',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color:
                                        medicationData.medications[match].color,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  padding: EdgeInsets.zero,
                                ),
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
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 90,
              color: const Color.fromARGB(255, 106, 144, 247),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    iconSize: 30,
                    icon: const Icon(Icons.call, color: Colors.white),
                    onPressed: () {},
                  ),
                  IconButton(
                    iconSize: 30,
                    icon: const Icon(Icons.message, color: Colors.white),
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
