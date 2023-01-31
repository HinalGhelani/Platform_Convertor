import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late DateTime newdate;

  DateTime currentDate = DateTime.now();
  TimeOfDay currentTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery
        .of(context)
        .size
        .height;
    double w = MediaQuery
        .of(context)
        .size
        .width;
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Date",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.blueGrey,
                      fontSize: 20),
                ),
                Text(
                  "${currentDate.day}/${currentDate.month}/${currentDate.year}",
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.blueGrey,
                      fontSize: 20),
                ),
              ],
            ),
            const SizedBox(height: 15),
            GestureDetector(
              onTap: () async {
                DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: currentDate,
                    firstDate: DateTime(2010),
                    lastDate: DateTime(2025));
                if (picked != null && picked != currentDate) {
                  setState(() {
                    currentDate = picked;
                  });
                }
                print(currentDate);
              },
              child: Container(
                height: 40,
                width: w,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: const Text(
                  "Change Date",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Time",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.blueGrey,
                      fontSize: 20),
                ),
                Text(
                  "${currentTime.hour}:${currentTime.minute} ${currentTime.period.name}",
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.blueGrey,
                      fontSize: 20),
                ),
              ],
            ),
            const SizedBox(height: 15),
            GestureDetector(
              onTap: () async {
                TimeOfDay? pickedTime = (
                    await showTimePicker(
                    context: context,
                    initialTime: currentTime));
                if(pickedTime!= null && pickedTime!=currentTime){
                  setState(() {
                    currentTime = pickedTime;
                  });
                }
              },
              child: Container(
                height: 40,
                width: w,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: const Text(
                  "Change Time",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
