import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import 'package:nauggets_flutter_task/view/login_signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homeview extends StatelessWidget {
  Homeview({super.key});

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

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
      body: Center(child: Text("Home screen")),
    );
  }
}
