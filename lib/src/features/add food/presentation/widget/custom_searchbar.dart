import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colors.dart';

class CustomSearchField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;

  final Color borderColor;
  final Color cursorColor;

  const CustomSearchField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.textInputAction,
    required this.keyboardType,
    this.borderColor = const Color.fromARGB(255, 235, 233, 241),
    this.cursorColor = Colors.grey,
  }) : super(key: key);

  @override
  _CustomSearchFieldState createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  OutlineInputBorder customBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: color, width: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNode,
      cursorColor: widget.cursorColor,
      controller: widget.controller,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
        fillColor: Color.fromARGB(255, 245, 246, 248),
        focusedBorder: customBorder(widget.borderColor),
        enabledBorder: customBorder(widget.borderColor),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: testFormFieldHintTextColor,
          fontSize: 12.sp,
        ),
        prefixIcon: Icon(CupertinoIcons.search, color: Colors.black),
      ),
    );
  }
}
