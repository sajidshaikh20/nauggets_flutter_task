import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:nauggets_flutter_task/view/acount_view.dart';

import 'package:nauggets_flutter_task/view/login_signup.dart';
import 'package:nauggets_flutter_task/view/setting_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homeview extends StatefulWidget {
  Homeview({super.key});

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  int _myIndex = 0;
  List<Widget> _screenData = <Widget>[
    AccountScreen(),
    SettingScreen(),
    Container()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 35, 104, 223),
        leading: BackButton(
          color: Colors.white,
          onPressed: () async {
            final SharedPreferences? prefs = await _prefs;
            prefs?.clear();
            Get.offAll(Authscreen());
          },
        ),
        actions: [
          GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.menu,
                  size: 35,
                ),
              )),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _myIndex = index;
          });
        },
        currentIndex: _myIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
        ],
      ),
      body: _screenData[_myIndex],
    );
  }
}
