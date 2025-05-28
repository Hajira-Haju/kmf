import 'package:associations_app/core/constants/const_datas.dart';
import 'package:associations_app/core/constants/const_datas.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomField extends StatelessWidget {
  CustomField({
    super.key,
    required this.hint,
    this.isObscure = false,
    this.validator,
    this.maxLength,
    this.onChanged,
    this.onFieldSubmitted
  });
  final String hint;
  final void Function(String)? onChanged;
  final bool isObscure;
  String? Function(String?)? validator;
  ValueChanged<String>? onFieldSubmitted;
  int? maxLength;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        onFieldSubmitted: onFieldSubmitted,
        autovalidateMode: AutovalidateMode.always,
        obscureText: isObscure,
        onChanged: onChanged,
        keyboardType: TextInputType.number,
        validator: validator,
        maxLength: maxLength,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(20),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.grey),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: ConstData.secondaryClr),
          ),
        ),
      ),
    );
  }
}
