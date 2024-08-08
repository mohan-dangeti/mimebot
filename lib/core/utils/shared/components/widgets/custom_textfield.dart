import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../configs/styles/colors.dart';

class CustomTextField1 extends StatelessWidget {
  final GlobalKey<FormState>? formKey;
  final String? hintText;
  final EdgeInsetsGeometry? contentPadding;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;

  const CustomTextField1({
    Key? key,
    this.contentPadding = const EdgeInsets.fromLTRB(13, 10, 13, 10),
    this.controller,
    this.obscureText = false,
    this.hintText,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.formKey,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: AppColor.txtColorMain,
              )
            : null,
        suffixIcon: suffixIcon,
        hintStyle: TextStyle(
            fontSize: 13.sp,
            color: AppColor.txtColorMain,
            fontFamily: "poppinsMedium"),
        contentPadding: contentPadding,
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black54, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black54, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Colors.black54, width: 1.5), // Specify error border
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Colors.black54, width: 1.5), // Specify error border
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
