import 'package:associations_app/core/constants/const_datas.dart';
import 'package:associations_app/core/constants/const_datas.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomField extends StatelessWidget {
  const CustomField({
    super.key,
    required this.hint,
    this.isObscure = false,
    this.suffix,
    required this.prefix,
  });
  final String hint;
  final bool isObscure;
  final Widget? suffix;
  final IconData prefix;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: TextFormField(
        obscureText: isObscure,
        decoration: InputDecoration(
          prefixIcon: Icon(prefix),
          hintText: hint,
          suffixIcon: suffix,
          labelStyle: TextStyle(color: Colors.brown.shade300),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide(color: ConstData.primaryClr),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide(color: ConstData.primaryClr),
          ),
        ),
      ),
    );
  }
}
