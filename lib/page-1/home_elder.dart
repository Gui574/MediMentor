import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'add_med.dart';
import 'login_screen.dart';

class HomeElder extends StatefulWidget {
  HomeElder({
    Key? key,
  }) : super(key: key);

  _HomeElderState createState() => _HomeElderState();
}

class _HomeElderState extends State<HomeElder> {
  DateTime selectedDate = DateTime.now();
  Color iconColor = Colors.yellow;

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
                  IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      icon: Icon(Icons.logout))
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
              child: Consumer<MedicationData>(
                  builder: (context, medicationData, _) {
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
                                      'Dosage: ${medication.dosage}',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'Time: ${medication.time.hour}:${medication.time.minute}',
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
