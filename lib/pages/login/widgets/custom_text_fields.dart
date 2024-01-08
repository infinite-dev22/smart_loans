import 'package:flutter/material.dart';
import 'package:smart_loans/global_values.dart';
import 'package:smart_loans/theme/colors.dart';
import 'package:smart_loans/theme/light.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final bool obscureText;
  final bool isEmail;
  final BorderSide borderSide;
  final Color fillColor;
  final TextStyle? style;
  final bool enabled;
  final Function(String)? onChanged;
  final Function()? onTap;

  const AuthTextField({
    super.key,
    this.controller,
    required this.hintText,
    required this.obscureText,
    this.isEmail = false,
    this.borderSide = BorderSide.none,
    this.fillColor = AppColor.white45,
    this.style,
    this.enabled = true,
    this.onChanged,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        cursorColor: AppColor.primary,
        validator: (val) =>
            val!.isEmpty ? 'Required field, Please fill in.' : null,
        controller: controller,
        onChanged: onChanged,
        obscureText: obscureText,
        style: style,
        enabled: enabled,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail),
          focusedBorder: (borderSide != BorderSide.none)
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(circularRadius),
                  borderSide: const BorderSide(
                    color: AppColor.primary,
                    width: 2.0,
                  ),
                )
              : null,
          enabledBorder: (borderSide != BorderSide.none)
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(circularRadius),
                  borderSide: const BorderSide(
                    color: AppColor.primary,
                  ),
                )
              : null,
          border: OutlineInputBorder(
            borderSide: borderSide,
            borderRadius: BorderRadius.circular(circularRadius),
          ),
          fillColor: fillColor,
          filled: true,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: AppColor.inActiveColor,
            fontSize: 16,
          ),
        ),
        keyboardType: TextInputType.emailAddress,
        onTap: onTap,
      ),
    );
  }
}

class AuthPasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final BorderSide borderSide;
  final Color fillColor;
  final Color iconColor;
  final bool enabled;
  final TextStyle? style;
  final Function()? onTap;

  const AuthPasswordTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.borderSide = BorderSide.none,
    this.fillColor = AppColor.white45,
    this.iconColor = LightAppColor.darker,
    this.style,
    this.enabled = true,
    this.onTap,
  });

  @override
  State<AuthPasswordTextField> createState() => _AuthPasswordTextField();
}

class _AuthPasswordTextField extends State<AuthPasswordTextField> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        cursorColor: AppColor.primary,
        validator: (val) =>
            val!.isEmpty ? 'Required field, Please fill in.' : null,
        controller: widget.controller,
        obscureText: obscure,
        style: widget.style,
        enabled: widget.enabled,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock),
          focusedBorder: (widget.borderSide != BorderSide.none)
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(circularRadius),
                  borderSide: const BorderSide(
                    color: AppColor.primary,
                    width: 2.0,
                  ),
                )
              : null,
          enabledBorder: (widget.borderSide != BorderSide.none)
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(circularRadius),
                  borderSide: const BorderSide(
                    color: AppColor.primary,
                  ),
                )
              : null,
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  obscure = !obscure;
                });
              },
              icon: Icon(
                obscure ? Icons.visibility_off : Icons.visibility_rounded,
                color: widget.iconColor,
              )),
          border: OutlineInputBorder(
            borderSide: widget.borderSide,
            borderRadius: BorderRadius.circular(circularRadius),
          ),
          fillColor: widget.fillColor,
          filled: true,
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            color: AppColor.inActiveColor,
            fontSize: 16,
          ),
        ),
        keyboardType: TextInputType.visiblePassword,
        onTap: widget.onTap,
      ),
    );
  }
}
