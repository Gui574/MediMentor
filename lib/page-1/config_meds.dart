import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'add_med.dart';
import 'login_screen.dart';

class ConfigMedsPage extends StatefulWidget {
   List<Medication> medicationData;

   ConfigMedsPage({
    Key? key,
    required this.medicationData,
  }) : super(key: key);

  @override
  _ConfigMedsPageState createState() => _ConfigMedsPageState();
}

class _ConfigMedsPageState extends State<ConfigMedsPage> {
  DateTime selectedDate = DateTime.now();
  
  void updateMedicationData(List<Medication> newData) {
  setState(() {
        selectedDate = DateTime(selectedDate.year, selectedDate.month, selectedDate.day);
      });
}


  @override
  Widget build(BuildContext context) {

    var filteredList = widget.medicationData.where((data) => data.date == selectedDate).toList();

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
                        filteredList = widget.medicationData.where((data) => data.date == selectedDate).toList();
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    
                    Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => AddMedsPage(
      onUpdateMedicationData: updateMedicationData,
      medicationData: widget.medicationData,
    ),
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
