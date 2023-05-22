import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp/page-1/check_meds.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'add_med.dart';
import 'home_caretaker.dart';
import 'login_screen.dart';
import 'package:intl/date_symbol_data_local.dart';

class ConfigMedsPage extends StatefulWidget {
  ConfigMedsPage({
    Key? key,
  }) : super(key: key);

  @override
  _ConfigMedsPageState createState() => _ConfigMedsPageState();
}

class _ConfigMedsPageState extends State<ConfigMedsPage> {
  DateTime selectedDate = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  late PageController _pageController;

  void _changeMonth(int months) {
    setState(() {
      _focusedDay = DateTime(_focusedDay.year, _focusedDay.month + months);
      _pageController.jumpToPage(_pageController.page!.toInt() + months);
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _focusedDay.month - 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              color: Color.fromARGB(255, 106, 144, 247),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: Color.fromARGB(255, 255, 255, 255),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    'Configurate Medications',
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
                    color: (Color.fromARGB(255, 255, 255, 255)),
                  )
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
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: DateTime.now(),
              selectedDayPredicate: (day) => isSameDay(selectedDate, day),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  selectedDate = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
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
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Dosage: ${medication.dosage}',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Time: ${medication.time.hour}:${medication.time.minute}',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color.fromARGB(255, 0, 0, 0),
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
                }
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
                        builder: (context) =>
                            AddMedsPage(selectedDate: selectedDate),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(150, 50),
                    backgroundColor: Color.fromARGB(255, 106, 144, 247),
                  ),
                  child: Text('+ Add Medication'),
                ),
              ],
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
