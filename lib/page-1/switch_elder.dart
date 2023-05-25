import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp/page-1/home_caretaker.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import 'add_elder.dart';
import 'add_med.dart';
import 'check_meds.dart';
import 'login_screen.dart';

class Switch_Elder extends StatelessWidget {
  String formatFirstWord(String input) {
    if (input.isEmpty) {
      return input;
    }
    final List<String> words = input.split(' ');
    if (words.isEmpty) {
      return input;
    }
    final String firstWord = words[0];
    final String formattedFirstWord =
        '${firstWord[0].toUpperCase()}${firstWord.substring(1)}';
    words[0] = formattedFirstWord;
    return words[0];
  }

  @override
  Widget build(BuildContext context) {
    final List<Elder> elders = Provider.of<ElderData>(context).elders;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 106, 144, 247),
        title: Text('Select Elder'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 106, 144, 247),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Add_ElderPage()),
          );
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: GridView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: elders.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          final Elder elder = elders[index];
          return GestureDetector(
            onTap: () {
              selectedElder = formatFirstWord(elder.name);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeCaretaker(),
                ),
              );
            },
            child: Card(
              child: Column(
                children: [
                  Expanded(
                    child: Image.file(
                      elder.image!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(elder.name),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
