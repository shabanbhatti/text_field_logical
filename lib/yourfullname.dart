import 'package:flutter/material.dart';

class YourNameTextField extends StatefulWidget {
   YourNameTextField({super.key, required this.enableBorderColor, required this.controller, required this.hintText, required this.hintTextColor});
var enableBorderColor;
  var hintText;
  var hintTextColor;
  var controller;
  @override
  State<YourNameTextField> createState() => _YourNameTextField();
}

class _YourNameTextField extends State<YourNameTextField> {
  
  var focusNode = FocusNode();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 500,
      child: TextField(
        // focusNode: focusNode,
        onChanged: (value) {
          setState(() {});
        },
        controller: widget.controller,
        style: const TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.person,
              color: Colors.white,
            ),
            labelText: widget.hintText,
            labelStyle:  TextStyle(color: widget.hintTextColor),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide:  BorderSide(color: widget.enableBorderColor)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: Colors.blue, width: 3))),
      ),
    );
  }
}
