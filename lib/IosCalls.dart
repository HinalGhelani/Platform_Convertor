import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Globals.dart';

class IosCalls extends StatefulWidget {
  const IosCalls({Key? key}) : super(key: key);

  @override
  State<IosCalls> createState() => _IosCallsState();
}

class _IosCallsState extends State<IosCalls> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
          children: Global.contact.map((e) {
        return Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
          child: Container(
            padding: const EdgeInsets.all(5),
            height: 70,
            width: double.infinity,
            color: CupertinoColors.white,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: CircleAvatar(
                    backgroundImage: AssetImage("${e['callImage']}"),
                    radius: 35,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${e['callName']}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: CupertinoColors.darkBackgroundGray,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "${e['callTime']}",
                        style: const TextStyle(
                          fontSize: 13,
                          color: CupertinoColors.darkBackgroundGray,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        final Uri url = Uri.parse('tel:${e['contact']}');
                        launchUrl(url);
                      });
                    },
                    child: const Icon(
                      CupertinoIcons.phone_solid,
                      color: Colors.teal,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList()),
    );
  }
}
