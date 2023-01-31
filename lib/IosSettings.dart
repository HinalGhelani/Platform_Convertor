import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Globals.dart';

class IosSettings extends StatefulWidget {
  const IosSettings({Key? key}) : super(key: key);

  @override
  State<IosSettings> createState() => _IosSettingsState();
}

class _IosSettingsState extends State<IosSettings> {
  DateTime currentDate = DateTime.now();
  DateTime currentTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
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
                      color: CupertinoColors.inactiveGray,
                      fontSize: 20),
                ),
                Text(
                  "${currentDate.day}/${currentDate.month}/${currentDate.year}",
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.inactiveGray,
                      fontSize: 20),
                ),
              ],
            ),
            const SizedBox(height: 15),
            CupertinoButton(
                child: const Text("Change Date"),
                color: CupertinoColors.inactiveGray,
                onPressed: () {
                  showCupertinoModalPopup(
                    barrierColor: Colors.transparent,
                      context: context,
                      builder: (context) {
                        return Center(
                          child: Container(
                            height: 300,
                            width: 300,
                            child: CupertinoDatePicker(
                              backgroundColor: CupertinoColors.black.withOpacity(0.6),
                              use24hFormat: false,
                              dateOrder: DatePickerDateOrder.dmy,
                              maximumYear: 2025,
                              minimumYear: 2010,
                              initialDateTime: currentDate,
                              mode: CupertinoDatePickerMode.date,
                              onDateTimeChanged: (val) {
                                setState(() {
                                  currentDate = val;
                                });
                              },
                            ),
                          ),
                        );
                      });
                }),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                const Text(
                  "Time",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.inactiveGray,
                      fontSize: 20),
                ),
                Text(
                  "${currentTime.hour}:${currentTime.minute} ",
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.inactiveGray,
                      fontSize: 20),
                ),
              ],
            ),
            const SizedBox(height: 15),
            CupertinoButton(
              color: CupertinoColors.inactiveGray,
                child: const Text("Change Time"),
                onPressed: () {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return Center(
                          child: Container(
                            height: 300,
                            width: 300,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: CupertinoColors.black.withOpacity(0.6)),
                            child: CupertinoDatePicker(
                              use24hFormat: false,
                              initialDateTime: currentTime,
                              mode: CupertinoDatePickerMode.time,
                              onDateTimeChanged: (val) {
                                setState(() {
                                  currentTime = val;
                                });
                              },
                            ),
                          ),
                        );
                      });
                })
          ],
        ),
      ),
    );
  }
}
