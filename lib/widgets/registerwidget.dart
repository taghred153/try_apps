import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterWidget extends StatelessWidget {
  final TextEditingController controller;
  final String labeltext;
  final IconData icon;
  final bool hidden;
  const RegisterWidget({
    super.key,
    required this.controller,
    required this.labeltext,
    required this.icon,
    this.hidden = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        obscureText: hidden,
        validator: (value){
          if (value == null || value.isEmpty)
            {
              return "Please Enter This Fields";
            }
          return null;
        },
        decoration: InputDecoration(
          labelText: labeltext,
          border: OutlineInputBorder(),
          suffixIcon: Icon(icon),
        ),
      ),
    );
  }
}
