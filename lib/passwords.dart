import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  PasswordTextField(
      {super.key,
      required this.confirmPasswordController,
      required this.createPasswordController,
      required this.confirmHintText,
      required this.createHintText,
      required this.enableBorderColor,
      required this.hintTextColor});
  var createPasswordController;
  var confirmPasswordController;
  var enableBorderColor;
  var createHintText;
  var confirmHintText;
  var hintTextColor;

  @override
  State<PasswordTextField> createState() => _PasswordTextField();
}

class _PasswordTextField extends State<PasswordTextField> {
  var isCreatePasswordObscure = true;
  var isConfirmPasswordObscure = true;

  var error = '';

  var focusNode = FocusNode();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.createPasswordController.dispose();
    widget.createPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: 50,
          width: 500,
          child: TextField(
            // focusNode: focusNode,
            obscureText: isCreatePasswordObscure,
            onChanged: (value) {
              setState(() {
                if (widget.createPasswordController.text !=
                    widget.confirmPasswordController.text) {
                  setState(() {
                    error = "Password doesn't match";
                  });
                }
                if (widget.createPasswordController.text ==
                    widget.confirmPasswordController.text) {
                  setState(() {
                    error = "Password matched";
                  });
                }

                if (widget.createPasswordController.text.isEmpty ||
                    widget.confirmPasswordController.text.isEmpty) {
                  setState(() {
                    error = "";
                  });
                }
              });
            },
            controller: widget.createPasswordController,
            style: const TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                suffixIcon: isCreatePasswordObscure == true
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            isCreatePasswordObscure = false;
                          });
                        },
                        icon: const Icon(
                          Icons.visibility_off,
                          color: Colors.white,
                        ),
                      )
                    : IconButton(
                        onPressed: () {
                          setState(() {
                            isCreatePasswordObscure = true;
                          });
                        },
                        icon: const Icon(
                          Icons.visibility,
                          color: Colors.white,
                        ),
                      ),
                labelText: widget.createHintText,
                labelStyle: TextStyle(color: widget.hintTextColor),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: widget.enableBorderColor)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide:
                        const BorderSide(color: Colors.blue, width: 3))),
          ),
        ),

        const SizedBox(
          height: 50,
        ),

        // ----------------------------------------------------------------------------------------
        error == "Password doesn't match"
            ? Text(
                error,
                style: const TextStyle(color: Colors.red, fontSize: 19),
              )
            : Text(
                error,
                style: const TextStyle(color: Colors.green, fontSize: 15),
              ),
        const SizedBox(
          height: 10,
        ),

        SizedBox(
          height: 50,
          width: 500,
          child: TextField(
            // focusNode: focusNode,
            obscureText: isConfirmPasswordObscure,
            onChanged: (value) {
              if (widget.createPasswordController.text !=
                  widget.confirmPasswordController.text) {
                setState(() {
                  error = "Password doesn't match";
                });
              }
              if (widget.createPasswordController.text ==
                  widget.confirmPasswordController.text) {
                setState(() {
                  error = "Password matched";
                });
              }

              if (widget.createPasswordController.text.isEmpty ||
                  widget.confirmPasswordController.text.isEmpty) {
                setState(() {
                  error = "Both are required";
                });
              }
            },

            controller: widget.confirmPasswordController,
            style: const TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                suffixIcon: isConfirmPasswordObscure == true
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            isConfirmPasswordObscure = false;
                          });
                        },
                        icon: const Icon(
                          Icons.visibility_off,
                          color: Colors.white,
                        ),
                      )
                    : IconButton(
                        onPressed: () {
                          setState(() {
                            isConfirmPasswordObscure = true;
                          });
                        },
                        icon: const Icon(
                          Icons.visibility,
                          color: Colors.white,
                        ),
                      ),
                labelText: widget.confirmHintText,
                labelStyle: TextStyle(color: widget.hintTextColor),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: widget.enableBorderColor)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide:
                        const BorderSide(color: Colors.blue, width: 3))),
          ),
        )
      ],
    );
  }
}
