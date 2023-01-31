import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Globals.dart';

class Calls extends StatefulWidget {
  const Calls({Key? key}) : super(key: key);

  @override
  State<Calls> createState() => _CallsState();
}

class _CallsState extends State<Calls> {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: ListView(
          children:
          Global.contact.map((e) => Card(
            elevation: 0,
            child: ListTile(
              onTap: (){},
              leading: CircleAvatar(
                backgroundImage: AssetImage("${e['callImage']}"),
              ),
              title: Text("${e['callName']}"),
              subtitle: Text("${e['callTime']}"),
              trailing:  IconButton(onPressed: (){
                final Uri url = Uri.parse('tel:${e['contact']}');
                launchUrl(url);
              },icon: const Icon(Icons.call),color: const Color(0xff008069),)
            ),
          )).toList(),
        ),
      );
  }
}
