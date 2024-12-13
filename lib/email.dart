import 'package:flutter/material.dart';

class EmailTextField extends StatefulWidget {
  EmailTextField(
      {super.key,
      required this.enableBorderColor,
      required this.controller,
      required this.hintText, required this.hintTextColor});
  var enableBorderColor;
  var hintText;
  var hintTextColor;
  var controller;
  @override
  State<EmailTextField> createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  var focusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    widget.controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 500,
      child: TextField(
        keyboardType: TextInputType.emailAddress,
// focusNode: focusNode,
        onChanged: (value) {
          setState(() {});
        },
        controller: widget.controller,
        style: const TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.mail,
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
            labelStyle:  TextStyle(color: widget.hintTextColor),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: widget.enableBorderColor)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: Colors.blue, width: 3))),
      ),
    );
  }
}
