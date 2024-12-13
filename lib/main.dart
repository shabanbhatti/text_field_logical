import 'package:flutter/material.dart';
import 'package:text_field_f18assignment/email.dart';
import 'package:text_field_f18assignment/passwords.dart';
import 'package:text_field_f18assignment/phonenumber.dart';

import 'package:text_field_f18assignment/yourfullname.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // -------Email Portion--------------------
  Color emailBorderColor = Colors.white;
  Color emailHintColor = Colors.white;
  var emailHintText = 'Enter Your Email';
  var emailController = TextEditingController();
  // -------Your Name Portion--------------
  Color yourNameBorderColor = Colors.white;
  Color yourNameHintColor = Colors.white;
  var yourNameHintText = 'Enter Your full Name';
  var yourNameController = TextEditingController();
  // ----------Number portion-------------
  Color numberBorderColor = Colors.white;
  Color numberHintColor = Colors.white;
  var numberHintText = 'Enter Your full Name';
  var numberController = TextEditingController();
// ---------Password portion-------------
  Color passwordBorderColor = Colors.white;
  Color passwordHintColor = Colors.white;
  var createPasswordHintText = 'Create your password';
  var confirmPasswordHintText = 'Confirm your password';
  var createPasswordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  Color scaffold = Colors.black;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: scaffold,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 500,
                  ),
                  SizedBox(
                    height: 50,
                    width: 100,
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (scaffold == Colors.black) {
                              scaffold =
                                  const Color.fromARGB(255, 163, 163, 163);
                            } else {
                              scaffold = Colors.black;
                            }
                          });
                        },
                        child: scaffold == Colors.black
                            ? const Icon(Icons.light_mode)
                            : const Icon(Icons.dark_mode)),
                  )
                ],
              ),
              const Text(
                'Create Your Account',
                style: TextStyle(fontSize: 30, color: Colors.blue),
              ),
              EmailTextField(
                enableBorderColor: emailBorderColor,
                controller: emailController,
                hintText: emailHintText,
                hintTextColor: emailHintColor,
              ),
              YourNameTextField(
                controller: yourNameController,
                hintText: yourNameHintText,
                hintTextColor: yourNameHintColor,
                enableBorderColor: yourNameBorderColor,
              ),
              PhoneNumberTextField(
                controller: numberController,
                enableBorderColor: numberBorderColor,
                hintText: numberHintText,
                hintTextColor: numberHintColor,
              ),
              PasswordTextField(
                confirmHintText: confirmPasswordHintText,
                confirmPasswordController: confirmPasswordController,
                createHintText: createPasswordHintText,
                enableBorderColor: passwordBorderColor,
                createPasswordController: createPasswordController,
                hintTextColor: passwordHintColor,
              ),

// ----------------Button-----------------------

              SizedBox(
                height: 50,
                width: 500,
                child: ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.blue)),
                    onPressed: () {
                      // -----------EMail -----------
                      if (emailController.text.isEmpty) {
                        setState(() {
                          emailBorderColor = Colors.red;
                          emailHintColor = Colors.red;
                          emailHintText = "Email is required";
                        });
                      } else if (emailController.text.isNotEmpty) {
                        setState(() {
                          emailBorderColor = Colors.white;
                          emailHintText = "Enter Your Email";
                          emailHintColor = Colors.white;
                        });
                      }
                      // ------------Your Name------------------
                      if (yourNameController.text.isEmpty) {
                        setState(() {
                          yourNameBorderColor = Colors.red;
                          yourNameHintColor = Colors.red;
                          yourNameHintText = 'Name is required';
                        });
                      } else {
                        setState(() {
                          yourNameBorderColor = Colors.white;
                          yourNameHintColor = Colors.white;
                          yourNameHintText = 'Name is required';
                        });
                      }

                      if (numberController.text.isEmpty) {
                        setState(() {
                          numberBorderColor = Colors.red;
                          numberHintColor = Colors.red;
                          numberHintText = 'Number is required';
                        });
                      } else {
                        setState(() {
                          numberBorderColor = Colors.white;
                          numberHintColor = Colors.white;
                          numberHintText = 'Enter Your Number';
                        });
                      }

                      // -------------Create Password portion-------------

                      if (createPasswordController.text.isEmpty) {
                        setState(() {
                          passwordBorderColor = Colors.red;
                          passwordHintColor = Colors.red;
                          createPasswordHintText = 'Password is required';
                        });
                      } else {
                        setState(() {
                          passwordBorderColor = Colors.white;
                          passwordHintColor = Colors.white;
                          createPasswordHintText = 'Password is required';
                        });
                      }
// ----------------------------Confirm Password portion-------------------

                      if (confirmPasswordController.text.isEmpty) {
                        setState(() {
                          passwordBorderColor = Colors.red;
                          passwordHintColor = Colors.red;
                          confirmPasswordHintText = 'Password is required';
                        });
                      } else {
                        setState(() {
                          passwordBorderColor = Colors.white;
                          passwordHintColor = Colors.white;
                          confirmPasswordHintText = 'Password is required';
                        });
                      }
                    },
                    child: const Text(
                      'Save',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
