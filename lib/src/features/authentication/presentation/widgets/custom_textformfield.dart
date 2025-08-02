import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final bool isPassword;
  final String? Function(String?)? validator;
  final Color borderColor;
  final Color cursorColor;
  final TextStyle labelStyle;
  final TextStyle floatingLabelStyle;
  final bool readOnly;

  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.textInputAction,
    required this.keyboardType,
    required this.validator,
    this.isPassword = false,
    this.borderColor = const Color.fromARGB(255, 152, 148, 148),
    this.cursorColor = Colors.grey,
    this.readOnly = false,
    this.labelStyle = const TextStyle(color: Colors.grey, fontSize: 13),
    this.floatingLabelStyle = const TextStyle(color: Colors.grey),
  }) : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;
  late FocusNode _focusNode;
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() {
          _autoValidateMode = AutovalidateMode.disabled;
        });
      } else {
        setState(() {
          _autoValidateMode = AutovalidateMode.onUserInteraction;
        });
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  OutlineInputBorder customBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: BorderSide(color: color, width: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNode,
      autovalidateMode: _autoValidateMode,
      readOnly: widget.readOnly,
      cursorColor: widget.cursorColor,
      controller: widget.controller,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      obscureText: widget.isPassword ? _obscureText : false,
      validator: widget.validator,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        fillColor: textformfieldfillColor,
        floatingLabelStyle: widget.floatingLabelStyle,
        focusedBorder: customBorder(widget.borderColor),
        enabledBorder: customBorder(widget.borderColor),
        labelStyle: widget.labelStyle,
        hintText: widget.hintText,
        hintStyle: TextStyle(color: testFormFieldHintTextColor, fontSize: 12),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                icon: Icon(
                  _obscureText ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
                  color: testFormFieldHintTextColor,
                ),
              )
            : null,
      ),
    );
  }
}
