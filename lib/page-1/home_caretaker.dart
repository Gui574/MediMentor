import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myapp/page-1/check_meds.dart';
import 'package:myapp/page-1/switch_elder.dart';
import 'package:provider/provider.dart';

import 'add_elder.dart';
import 'add_med.dart';
import 'config_meds.dart';
import 'login_screen.dart';

class HomeCaretaker extends StatefulWidget {
  const HomeCaretaker({Key? key}) : super(key: key);

  @override
  _HomeCaretakerPageState createState() => _HomeCaretakerPageState();
}

class _HomeCaretakerPageState extends State<HomeCaretaker> {
  DateTime selectedDate = DateTime.now();
  late Timer _timer;
  final Color _iconColor = Colors.white;

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
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
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
        .where((medication) =>
            medication.color == Colors.red && medication.elder == selectedElder)
        .toList();
    int missedMedicationCount = missedMedications.length;

    // Check if the list of elders is empty
    ElderData elderData = Provider.of<ElderData>(context);
    bool isElderListEmpty = elderData.elders.isEmpty;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 106, 144, 247),
        title: Text('Home'),
        actions: [
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
                              builder: (context) => const LoginScreen(),
                            ),
                          ); // Close the dialog
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
            color: _iconColor,
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 106, 144, 247),
              ),
              child: Image.asset(
                'assets/page-1/images/logo_transparent.png', // Replace with your image path
                width: 300,
                height: 300,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.account_box,
              ),
              title: const Text('Account'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.change_circle,
              ),
              title: const Text('Switch Elder'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Switch_Elder(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
              ),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
              ),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            if (selectedElder != '') ...[
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width:
                                10), // Add a spacing of 10 pixels between the welcome message and the image
                        Image.asset(
                          'assets/page-1/images/pill.jpg', // Replace with your image path
                          width: 70,
                          height: 100,
                        ),
                        Text(
                          'Welcome, Mr.$selectedElder !',
                          style: TextStyle(fontSize: 24),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Below you can see your alerts and configure/check the medication associated with Mr. $selectedElder',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
            if (selectedElder == '') ...[
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.warning,
                            size: 30,
                            color: Color.fromARGB(255, 26, 26, 26),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Please select or create an elder profile',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Switch_Elder(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(150, 50),
                          backgroundColor:
                              const Color.fromARGB(255, 106, 144, 247),
                        ),
                        child: Text('Select Elder Profile'),
                      ),
                    ],
                  ),
                ),
              ),
            ] else if (missedMedicationCount > 0) ...[
              SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 205, 217, 250),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.warning,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Center(
                          child: Text(
                            'Mr. António missed $missedMedicationCount medications today! Go to Check Medications to view them',
                            style: const TextStyle(
                              color: Color.fromARGB(255, 255, 0, 0),
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ] else ...[
              Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(20),
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
            if (selectedElder != '') ...[
              Column(
                children: [
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CheckMedsPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(350, 70),
                      padding: const EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor:
                          missedMedicationCount > 0 ? Colors.red : Colors.green,
                    ),
                    child: Text(
                      'Check Medications   ->',
                      style: TextStyle(
                        fontSize: 20,
                        color: missedMedicationCount > 0
                            ? Colors.white
                            : const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ],
            const Spacer(),
            Container(
              height: 70,
              color: const Color.fromARGB(255, 106, 144, 247),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: const Icon(Icons.home, color: Colors.white),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeCaretaker(),
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.fact_check, color: Colors.white),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CheckMedsPage(),
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.medication, color: Colors.white),
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
