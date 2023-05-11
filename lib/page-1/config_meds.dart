import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'add_med.dart';
import 'login_screen.dart';

class ConfigMedsPage extends StatefulWidget {
  ConfigMedsPage({
    Key? key,
  }) : super(key: key);

  @override
  _ConfigMedsPageState createState() => _ConfigMedsPageState();
}

class _ConfigMedsPageState extends State<ConfigMedsPage> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              color: Color.fromARGB(255, 90, 89, 89),
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
                    'Configurar de Medicamentos',
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
            Container(
              color: Color.fromARGB(255, 56, 55, 55),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Data: ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    child: Text(DateFormat('dd/MM/yyyy').format(selectedDate),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                    onPressed: () async {
                      final DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2030),
                      );
                      if (pickedDate != null && pickedDate != selectedDate) {
                        setState(() {
                          selectedDate = pickedDate;
                        });
                        //print(selectedDate);
                      }
                    },
                  ),
                ],
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
                                      'Time: ${medication.time}',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddMedsPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(150, 50),
                  ),
                  child: Text('+ Adicionar Medicamento'),
                ),
              ],
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
