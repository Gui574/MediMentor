import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'add_med.dart';
import 'login_screen.dart';

class HomeElder extends StatefulWidget {
  List<Medication> medicationData;

  HomeElder({
    Key? key,
    required this.medicationData,
  }) : super(key: key);
 
  _HomeElderState createState() => _HomeElderState();
}

class _HomeElderState extends State<HomeElder> {
  DateTime selectedDate = DateTime.now();
  
  @override
  Widget build(BuildContext context) {
    // Format the selected date in the desired format
    List<Medication> filteredList = widget.medicationData.where((data) => data.date == selectedDate).toList();
    final DateFormat dateFormat = DateFormat('EEEE, dd \'de\' MMMM \'de\' y', 'pt_BR');
    String formattedDate = dateFormat.format(selectedDate);
    print(widget.medicationData);
    setState(() {
        selectedDate = DateTime(selectedDate.year, selectedDate.month, selectedDate.day);
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
                  IconButton(onPressed: (){
                    Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (context) => LoginScreen(
      medicationData: widget.medicationData,
    )));},
                 icon: Icon(Icons.logout))
                ],
              ),
            ),
            Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              formattedDate,
              style: TextStyle(color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
            Expanded(child:RefreshIndicator(
  child: ListView.builder(
    itemCount: filteredList.length,
    itemBuilder: (BuildContext context, int index) {
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
                    filteredList[index].image!,
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
                        filteredList[index].name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Dosage: ${filteredList[index].dosage}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Time: ${filteredList[index].time.hour}:${filteredList[index].time.minute}',
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
  ),onRefresh: () {
    return Future.delayed(
      Duration(seconds: 1),
      () {
        /// adding elements in list after [1 seconds] delay
        /// to mimic network call
        ///
        /// Remember: setState is necessary so that
        /// build method will run again otherwise
        /// list will not show all elements
        setState(() {
        selectedDate = DateTime(selectedDate.year, selectedDate.month, selectedDate.day);
      });
         
        ;
      },
    );
  },)
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
