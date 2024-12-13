import 'package:flutter/material.dart';

class PhoneNumberTextField extends StatefulWidget {
   PhoneNumberTextField({super.key, required this.enableBorderColor, required this.controller, required this.hintText, required this.hintTextColor});
  var enableBorderColor;
  var hintText;
  var hintTextColor;
  var controller;

  @override
  State<PhoneNumberTextField> createState() => _PhoneNumberTextFieldState();
}

class _PhoneNumberTextFieldState extends State<PhoneNumberTextField> {
  

  var focusNode = FocusNode();
  var error = '';

@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.controller.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        error != ''
            ? Text(
                error,
                style: const TextStyle(color: Colors.red, fontSize: 18),
              )
            : const SizedBox(),
        SizedBox(
          height: 50,
          width: 500,
          child: TextField(
            keyboardType: TextInputType.number,
            // focusNode: focusNode,
            onChanged: (value) {
              setState(() {
                if (value.length >= 12) {
                  error = "Number is invalid";
                } else {
                  error = '';
                }
              });
            },
            controller: widget.controller,
            style: const TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.phone,
                  color: Colors.white,
                ),
                suffixIcon: widget.controller.text.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            widget.controller.clear();
                          });
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      )
                    : const SizedBox(
                        width: 0.1,
                        height: 0.1,
                      ),
                labelText: widget.hintText,
                labelStyle: TextStyle(color:widget.hintTextColor),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: widget.enableBorderColor)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide:
                        const BorderSide(color: Colors.blue, width: 3))),
          ),
        ),
      ],
    );
  }
}
