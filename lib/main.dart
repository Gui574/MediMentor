import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/page-1/login_screen.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/page-1/config_meds.dart';
import 'package:myapp/page-1/home_elder.dart';
import 'package:myapp/page-1/add_med.dart';
import 'package:myapp/page-1/check_meds.dart';
import 'package:myapp/page-1/home_caretaker.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await initializeDateFormatting('pt_BR', null);
  //List<Medication> medicationData = []; // initialize an empty list
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MedicationData(),
        ),
        ChangeNotifierProvider<TimerModel>(
          create: (_) => TimerModel(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MediMentor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}
