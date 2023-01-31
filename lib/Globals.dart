import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class Global {
  static List<Map<String, dynamic>> contact = [
    {
      'image': "build/chattingApp/sundar pichai.jpeg",
      'name': "Sundar Pichai",
      'subtitle': "Hey There!",
      'time': "12:28 pm",
      'callTime': "Yesterday, 9:41 PM",
      'callName': "Satya Nadella",
      'callImage': "build/chattingApp/satya nadella.webp",
      'contact': "9327561829",
    },
    {
      'image': "build/chattingApp/satya nadella.webp",
      'name': "Satya Nadella",
      'subtitle': "Done",
      'time': "11:25 pm ",
      'callTime': "Yesterday, 10:41 PM",
      'callName': "Sundar Pichai",
      'callImage': "build/chattingApp/sundar pichai.jpeg",
      'contact': "9087654321",
    },
    {
      'image': "build/chattingApp/rajeev suri.jpeg",
      'name': "Rajeev Suri",
      'subtitle': "Ready for deal?",
      'time': "4:23 am",
      'callTime': "April 11, 6:30 PM",
      'callName': "Francisco",
      'callImage': "build/chattingApp/francisco.jpg",
      'contact': "9870635421",
    },
    {
      'image': "build/chattingApp/francisco.jpg",
      'name': "Francisco",
      'subtitle': "It's Magic",
      'time': "12:28 pm",
      'callTime': "April 9, 8:48 AM",
      'callName': "Rajeev Suri",
      'callImage': "build/chattingApp/rajeev suri.jpeg",
      'contact': "8759644310",
    },
    {
      'image': "build/chattingApp/sanjay kumar.webp",
      'name': "Sanjay Kumar",
      'subtitle': "I throwed my phone.",
      'time': "12:28 pm",
      'callTime': "March 17, 2:45 PM",
      'callName': "Mukesh Ambani",
      'callImage': "build/chattingApp/mukesh ambani.jpeg",
      'contact': "8709658532",
    },
    {
      'image': "build/chattingApp/mukesh ambani.jpeg",
      'name': "Mukesh Ambani",
      'subtitle': "Ohk",
      'time': "Today",
      'callTime': "March 30, 5:48 PM",
      'callName': "Sanjay Kumar",
      'callImage': "build/chattingApp/sanjay kumar.webp",
      'contact': "8709235327",
    },
    {
      'image': "build/chattingApp/sanjay mehrotra.jpeg",
      'name': "Sanjay Mehrotra",
      'subtitle': "That's Great",
      'time': "Today",
      'callTime': "February 12, 2:45 PM",
      'callName': "Nikesh Arora",
      'callImage': "build/chattingApp/nikesh arora.jpeg",
      'contact': "7698542908",
    },
    {
      'image': "build/chattingApp/nikesh arora.jpeg",
      'name': "Nikesh Arora",
      'subtitle': "Thank You",
      'time': "1 day ago",
      'callTime': "January 14, 7:32 AM",
      'callName': "Dinesh C",
      'callImage': "build/chattingApp/dinesh c.jpeg",
      'contact': "9876086345",
    },
    {
      'image': "build/chattingApp/dinesh c.jpeg",
      'name': "Dinesh C.",
      'subtitle': "No Problem",
      'time': "2 day ago",
      'callTime': "November 12, 9:00 AM",
      'callName': "Indra Nooyi",
      'callImage': "build/chattingApp/indraa noyi.jpeg",
      'contact': "9874563421",
    },
    {
      'image': "build/chattingApp/indraa noyi.jpeg",
      'name': "Indra Nooyi",
      'subtitle': "oh Yes",
      'time': "3 day ago",
      'callTime': "November 11, 3:48 PM",
      'callName': "Indra Nooyi",
      'callImage': "build/chattingApp/indraa noyi.jpeg",
      'contact': "95632147957",
    }
  ];
  static bool isOn = true;
  static File? Image;
  static final picker = ImagePicker();
  static bool isIOS = true;
  static int select = 0;
  static String currentDate =
      '${DateTime.now().day},${DateTime.now().month} ${DateTime.now().year} ';

  static TextEditingController name = TextEditingController();
  static TextEditingController number = TextEditingController();
  static String addName = '', addNum = '';

  static GlobalKey<FormState> detail = GlobalKey<FormState>();

  static List l = [];
}
