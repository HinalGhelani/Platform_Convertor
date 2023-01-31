import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Globals.dart';

class IosChats extends StatefulWidget {
  const IosChats({Key? key}) : super(key: key);

  @override
  State<IosChats> createState() => _IosChatsState();
}

class _IosChatsState extends State<IosChats> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: Global.contact.map((e) {
          return Padding(
            padding: const EdgeInsets.only(left: 8,right: 8,top: 10),
            child: Container(
              padding: EdgeInsets.all(5),
              height: 70,
              width: double.infinity,
              color: CupertinoColors.white,
              child: Row(
                children: [
                   Expanded(
                    flex: 2,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("${e['image']}"),
                      radius: 35,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        Text(
                          "${e['name']}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: CupertinoColors.darkBackgroundGray,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "${e['contact']}",
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
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Text(
                          "${e['time']}",
                          style: const TextStyle(
                              fontSize: 12, color: CupertinoColors.darkBackgroundGray),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList()
      ),
    );
  }
}
