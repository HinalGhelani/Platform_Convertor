import 'package:ad_flutter/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'Globals.dart';
import 'IosCalls.dart';
import 'IosChats.dart';
import 'IosSettings.dart';
import 'calls.dart';
import 'chats.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController tabController;
  late PageController pageController = PageController();

  late CupertinoTabController IosController = CupertinoTabController();

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  List<Widget> pages = [
    const Chats(),
    const Calls(),
    const Settings(),
  ];

  List<Widget> IosPage = [
    const IosChats(),
    const IosCalls(),
    const IosSettings(),
  ];

  int i = 0;
  
  getImage() async {
    PickedFile? pic = await ImagePicker().getImage(source: ImageSource.gallery);
    if (pic != null) {
      setState(() {
        Global.Image = File(pic.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return (Global.isIOS == true)
        ? MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              '/': (context) => DefaultTabController(
                    length: 3,
                    child: Scaffold(
                      appBar: AppBar(
                        title: const Text(
                          "Platform Convertor",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        actions: [
                          Transform.scale(
                            scale: 1,
                            child: Switch(
                                activeColor: Colors.white,
                                value: Global.isOn,
                                onChanged: (val) {
                                  setState(() {
                                    Global.isIOS = false;
                                  });
                                }),
                          )
                        ],
                        bottom: TabBar(
                          onTap: (val) {
                            setState(() {
                              pageController.animateToPage(val,
                                  duration: const Duration(microseconds: 250),
                                  curve: Curves.easeIn);
                            });
                          },
                          indicatorColor: Colors.white70,
                          controller: tabController,
                          tabs: const <Tab>[
                            Tab(
                              child: Text(
                                "CHATS",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Tab(
                              child: Text("CALLS",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Tab(
                              child: Text("SETTINGS",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                        backgroundColor: Colors.blueGrey,
                        centerTitle: true,
                      ),
                      drawer: Drawer(
                        child: ListView(
                          padding: const EdgeInsets.all(0),
                          children: [
                            DrawerHeader(
                              decoration:
                                  const BoxDecoration(color: Colors.blueGrey),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: const [
                                  CircleAvatar(
                                    backgroundImage: AssetImage(
                                        "build/chattingApp/hinal2.jpg"),
                                    radius: 45,
                                  ),
                                  Text(
                                    "Hinal Ghelani",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    "91+ 9099778340",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white70,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            const ListTile(
                              leading: Icon(Icons.people_outlined),
                              title: Text("New Group"),
                            ),
                            const ListTile(
                              leading: Icon(Icons.person_outlined),
                              title: Text("New Contact"),
                            ),
                            const ListTile(
                              leading: Icon(Icons.phone_outlined),
                              title: Text("Calls"),
                            ),
                            const ListTile(
                              leading: Icon(Icons.bookmark_outline),
                              title: Text("Saved Message"),
                            ),
                            const ListTile(
                              leading: Icon(Icons.settings_outlined),
                              title: Text("Settings"),
                            ),
                          ],
                        ),
                      ),
                      floatingActionButton: (tabController.index == 0)
                          ? FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          contentPadding:
                                              const EdgeInsets.all(0),
                                          content: SizedBox(
                                              height: 420,
                                              width: double.infinity,
                                              child: Form(
                                                key: Global.detail,
                                                child: Stepper(
                                                  currentStep: i,
                                                  controlsBuilder:
                                                      (context, _) {
                                                    return Row(
                                                      children: [
                                                        (i == 2)
                                                            ? ElevatedButton(
                                                                style: ElevatedButton
                                                                    .styleFrom(
                                                                        primary:
                                                                            Colors.blueGrey),
                                                                onPressed: () {
                                                                  setState(() {
                                                                    Global.contact.add({
                                                                      'image': Global.Image,
                                                                      'name': Global.addName,
                                                                      'contact': Global.addNum,
                                                                    });
                                                                    Global.detail.currentState!.reset();
                                                                    imageCache.clear();
                                                                    Global.name.clear();
                                                                    Global.number.clear();
                                                                    Global.addName = '';
                                                                    Global.addNum = '';
                                                                  });
                                                                  Navigator.of(context)
                                                                      .pushReplacementNamed('/');
                                                                },
                                                                child:
                                                                    Text("Add"),
                                                              )
                                                            : ElevatedButton(
                                                                style: ElevatedButton
                                                                    .styleFrom(
                                                                        primary:
                                                                            Colors
                                                                                .blueGrey),
                                                                onPressed: () {
                                                                  setState(() {
                                                                    if (i < 2) {
                                                                      i++;
                                                                    }
                                                                  });
                                                                },
                                                                child: (i == 2)
                                                                    ? const Text(
                                                                        "Add")
                                                                    : const Text(
                                                                        "Continue")),
                                                        const SizedBox(
                                                            width: 10),
                                                        (i == 0)
                                                            ? Container()
                                                            : TextButton(
                                                                onPressed: () {
                                                                  setState(() {
                                                                    if (i > 0) {
                                                                      i--;
                                                                    }
                                                                  });
                                                                },
                                                                child:
                                                                    const Text(
                                                                  "Cancel",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .grey),
                                                                ),
                                                              ),
                                                      ],
                                                    );
                                                  },
                                                  steps: <Step>[
                                                    Step(
                                                      title: const Text("Photo"),
                                                      subtitle: const Text("Add Profile Photo"),
                                                      isActive: (i==0) ? true : false,
                                                      state: (i==0) ? StepState.editing : StepState.complete,
                                                      content: Stack(
                                                        alignment: Alignment
                                                            .bottomRight,
                                                        children: [
                                                          (Global.Image == null)
                                                              ? CircleAvatar(
                                                                  backgroundColor: Colors
                                                                      .grey
                                                                      .withOpacity(
                                                                          0.8),
                                                                  radius: 40,
                                                                  child:
                                                                      const Text(
                                                                    "ADD",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            20,
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                )
                                                              : CircleAvatar(
                                                                  radius: 40,
                                                                  backgroundImage:
                                                                  Image.file(
                                                                    Global.Image!,
                                                                    fit: BoxFit.cover,
                                                                  ).image,
                                                                ),
                                                          InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                getImage();
                                                              });
                                                            },
                                                            child: Container(
                                                              height: 25,
                                                              width: 25,
                                                              decoration:
                                                                  const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: Colors
                                                                    .blueGrey,
                                                              ),
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: const Icon(
                                                                Icons.add,
                                                                size: 20,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Step(
                                                      title: const Text("Name"),
                                                      subtitle: const Text(
                                                          "EnterName"),
                                                      isActive: (i==1) ? true : false,
                                                      state: (i==1) ? StepState.editing : StepState.complete,
                                                      content: SizedBox(
                                                        height: 45,
                                                        child: TextFormField(
                                                          controller:
                                                              Global.name,
                                                          validator: (val) {
                                                            if (val == null ||
                                                                val.isEmpty) {
                                                              return 'please enter this';
                                                            }
                                                            return null;
                                                          },
                                                          onChanged: (val) {
                                                            setState(() {
                                                              Global.addName =
                                                                  val;
                                                            });
                                                          },
                                                          decoration:
                                                              const InputDecoration(
                                                            border:
                                                                OutlineInputBorder(),
                                                            hintText:
                                                                "Hinal Ghelani",
                                                          ),
                                                          textDirection:
                                                              TextDirection.ltr,
                                                        ),
                                                      ),
                                                    ),
                                                    Step(
                                                      title: const Text(
                                                          "Contact Number"),
                                                      subtitle: const Text(
                                                          "Add Contact Number"),
                                                      isActive: (i==2) ? true : false,
                                                      state: (i==2) ? StepState.editing : StepState.complete,
                                                      content: Container(
                                                        height: 45,
                                                        alignment:
                                                            Alignment.center,
                                                        child: TextFormField(
                                                          controller:
                                                              Global.number,
                                                          validator: (val) {
                                                            if (val == null ||
                                                                val.isEmpty) {
                                                              return 'please enter this';
                                                            }
                                                            return null;
                                                          },
                                                          onChanged: (val) {
                                                            setState(() {
                                                              Global.addNum =
                                                                  val;
                                                            });
                                                          },
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          decoration:
                                                              const InputDecoration(
                                                            border:
                                                                OutlineInputBorder(),
                                                            hintText: "91+ ",
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )),
                                        );
                                      });
                                });
                              },
                              backgroundColor: Colors.blueGrey,
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            )
                          : null,
                      body: PageView(
                        onPageChanged: (val) {
                          setState(() {
                            tabController.animateTo(val);
                          });
                        },
                        controller: pageController,
                        children: pages.map((e) => e).toList(),
                      ),
                    ),
                  ),
            },
          )
        : CupertinoApp(
            debugShowCheckedModeBanner: false,
            routes: {
              '/': (context) => CupertinoPageScaffold(
                    navigationBar: CupertinoNavigationBar(
                      brightness: Brightness.light,
                      middle: const Text(
                        "Platform Convertor",
                        style: TextStyle(
                          fontSize: 20,
                          color: CupertinoColors.white,
                        ),
                      ),
                      trailing: Transform.scale(
                        scale: 0.8,
                        child: CupertinoSwitch(
                          onChanged: (val) {
                            setState(() {
                              Global.isIOS = true;
                            });
                          },
                          value: Global.isOn,
                        ),
                      ),
                      backgroundColor: CupertinoColors.inactiveGray,
                    ),
                    child: CupertinoTabScaffold(
                      controller: IosController,
                      backgroundColor: CupertinoColors.extraLightBackgroundGray,
                      tabBar: CupertinoTabBar(
                        onTap: (val) {
                          setState(() {});
                        },
                        height: 50,
                        backgroundColor: CupertinoColors.white,
                        activeColor: CupertinoColors.inactiveGray,
                        inactiveColor:
                            CupertinoColors.systemGrey2.withOpacity(0.7),
                        items: const <BottomNavigationBarItem>[
                          BottomNavigationBarItem(
                            icon: Icon(CupertinoIcons.chat_bubble_2_fill),
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(CupertinoIcons.phone_solid),
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(CupertinoIcons.settings_solid),
                          ),
                        ],
                      ),
                      tabBuilder: (context, i) {
                        return CupertinoTabView(
                          builder: (context) {
                            return IosPage[i];
                          },
                        );
                      },
                    ),
                  ),
            },
          );
  }
}
