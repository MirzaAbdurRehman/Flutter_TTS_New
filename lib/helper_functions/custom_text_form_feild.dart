
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTextField {

  static Widget CustomTextFormFiled({
    required TextEditingController controller,
    required String hintText,
    required String labelText,
    required IconData prefixIcon,
    bool isPassword = false,
    required String? Function(String?) validator
}) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      validator: validator,
      style: TextStyle(fontSize: 20),
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,

        prefixIcon: prefixIcon != null ? Icon(prefixIcon, color:  Colors.grey.shade600,) : null,

        filled: true,
        fillColor: Colors.grey.shade100,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),


        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.blue.shade300, width: 1.5),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.red),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.red, width: 1.5),
        )
      ),
    );


  }
}