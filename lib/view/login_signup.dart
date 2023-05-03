import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:nauggets_flutter_task/Widgets/input_field.dart';
import 'package:nauggets_flutter_task/Widgets/submit_button.dart';
import 'package:nauggets_flutter_task/controller/login_controller.dart';

import '../controller/registeration.dart';

class Authscreen extends StatelessWidget {
  Authscreen({super.key});

  RegisterationController registerationController =
      Get.put(RegisterationController());

  LoginController loginController = Get.put(LoginController());

  var isLogin = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(36),
            child: Center(
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 80,
                    ),
                    Row(
                      children: [
                        Container(
                          child: Text(
                            "Welcome,",
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "to Sign",
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        )
                      ],
                    ),
                    Text(
                      "in continue",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                          height: 60,
                          onPressed: () {
                            color:
                            !isLogin.value ? Colors.white : Colors.amber;
                            isLogin.value = false;
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {
                            color:
                            !isLogin.value ? Colors.black : Colors.brown;
                            isLogin.value = true;
                          },
                          child: Text("Login",
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    isLogin.value ? loginWidget() : registerWidget()
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Widget registerWidget() {
    return Column(
      children: [
        InputTextFieldWidget(
          textEditingController: registerationController.emailController,
          hintText: 'email',
        ),
        const SizedBox(
          height: 20,
        ),
        InputTextFieldWidget(
          textEditingController: registerationController.passwordController,
          hintText: 'passoword',
        ),
        const SizedBox(
          height: 20,
        ),
        SubmitButton(
          onPressed: () => registerationController.registerWithEmail(),
          title: 'Register',
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Forgot you password ?",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget loginWidget() {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        InputTextFieldWidget(
          textEditingController: loginController.emailController,
          hintText: 'email address',
        ),
        SizedBox(
          height: 30,
        ),
        InputTextFieldWidget(
            textEditingController: loginController.passwordController,
            hintText: 'password'),
        SizedBox(
          height: 20,
        ),
        SubmitButton(
            onPressed: () => loginController.loginwithEmail(), title: 'login '),
        SizedBox(
          height: 15,
        ),
        Text(
          "Forgot you password ?",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
