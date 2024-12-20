import 'package:delivery_app/constants.dart';
import 'package:flutter/material.dart';

class RegisterInfoWidget extends StatefulWidget {
  RegisterInfoWidget(
      {required this.hintText,
      required this.icon,
      this.onChanged,
      this.obscureText = false,
      this.minimum = 0,
      this.errorText,this.suffixIcon});

  final String hintText;
  final Icon icon;
  IconButton? suffixIcon;
  Function(String)? onChanged;
  bool? obscureText;
  int? minimum;
  String? errorText;

  @override
  State<RegisterInfoWidget> createState() => _RegisterInfoWidgetState();
}

class _RegisterInfoWidgetState extends State<RegisterInfoWidget> {
  final GlobalKey<FormState> formState = GlobalKey();

 final TextEditingController _passoword=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      child: Form(
        key: formState,
        autovalidateMode: AutovalidateMode.onUnfocus,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            border: Border.all(color: Colors.black),
          ),
          child: TextFormField(
            controller: _passoword,
            validator: (data) {
              if (data!.isEmpty) {
                return ' field is required';
              }
              if (data.length < widget.minimum!) {
                return widget.errorText;
              }
            },
            onChanged: widget.onChanged,
            obscureText: widget.obscureText!,
            decoration: InputDecoration(
              hintStyle: TextStyle(color: Colors.grey),
              hintText: widget.hintText,
              prefixIcon: widget.icon,
              prefixIconColor: kPrimaryColor,
              suffixIcon: widget.suffixIcon,
              border: InputBorder.none,
              errorStyle: TextStyle(color: Colors.red, fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }
}
