import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_loans/config/responsive.dart';
import 'package:smart_loans/global_values.dart';
import 'package:smart_loans/pages/login/bloc/login_bloc.dart';
import 'package:smart_loans/pages/login/widgets/custom_text_fields.dart';
import 'package:smart_loans/theme/colors.dart';
import 'package:smart_loans/theme/light.dart';

class LoginInitialWidget extends StatefulWidget {
  const LoginInitialWidget({super.key});

  @override
  State<LoginInitialWidget> createState() => _LoginInitialWidgetState();
}

class _LoginInitialWidgetState extends State<LoginInitialWidget> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isAuthingUser = false;
  bool rememberUser = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LogInBloc, LogInState>(
  builder: (context, state) {
    return BlocListener<LogInBloc, LogInState>(
      listener: (context, state) {
        if (state.status == LogInStatus.successfullyLoggedIn) {
          print("User Logged In");
          print(currentRoute);
          Navigator.popAndPushNamed(context, currentRoute);
        }
      },
      child: _buildBody(),
    );
  },
);
  }

  Widget _buildBody() {
    return Container(
      padding: EdgeInsets.all(padding * 4),
      margin: EdgeInsets.all(padding * 4),
      height: 60.h,
      width: 500,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColor.shadowColor.withOpacity(.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
        color: AppColor.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
            child: AuthTextField(
              hintText: "Email",
              enabled: !isAuthingUser,
              controller: emailController,
              obscureText: false,
              isEmail: true,
              borderSide: const BorderSide(color: AppColor.primary),
              style: const TextStyle(color: LightAppColor.darker),
              fillColor: Colors.transparent,
            ),
          ),
          SizedBox(height: 2.h),
          SizedBox(
            height: 50,
            child: AuthPasswordTextField(
              controller: passwordController,
              hintText: "Password",
              enabled: !isAuthingUser,
              borderSide: const BorderSide(color: AppColor.primary),
              style: const TextStyle(color: LightAppColor.darker),
              fillColor: Colors.transparent,
              iconColor: LightAppColor.darker,
            ),
          ),
          if (Responsive.isDesktop(context) || Responsive.isTablet(context))
            LayoutBuilder(builder: (context, constraints) {
              return SizedBox(
                width: constraints.maxWidth,
                child: Column(
                  children: [
                    SizedBox(height: 2.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: constraints.maxWidth * .6,
                          child: CheckboxListTile(
                            value: context.read<LogInBloc>().state.rememberUser,
                            onChanged: (val) {
                              if (val == null) {
                                rememberUser = false;
                              }
                              if (val != null) {
                                rememberUser = val;
                              }
                              context
                                  .read<LogInBloc>()
                                  .add(RememberUser(rememberUser));
                            },
                            title: const Text("Remember Me"),
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              print("I see you forgot your password!!!...");
                            },
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
          if (Responsive.isMobile(context))
            LayoutBuilder(builder: (context, constraints) {
              return SizedBox(
                width: constraints.maxWidth,
                child: CheckboxListTile(
                  value: context.read<LogInBloc>().state.rememberUser,
                  onChanged: (val) {
                    if (val == null) {
                      rememberUser = false;
                    }
                    if (val != null) {
                      rememberUser = val;
                    }
                    context.read<LogInBloc>().add(RememberUser(rememberUser));
                  },
                  title: const Text("Remember Me"),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              );
            }),
          SizedBox(height: 2.h),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: FilledButton(
              style: ButtonStyle(
                textStyle: const MaterialStatePropertyAll(
                  TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(circularRadius),
                    ),
                  ),
                ),
              ),
              onPressed: () {
                if (emailController.text.isNotEmpty &&
                    passwordController.text.isNotEmpty) {
                  context.read<LogInBloc>().add(
                      LogInUser(emailController.text, passwordController.text));
                }
              },
              child: const Text("Log In"),
            ),
          ),
          SizedBox(height: 2.h),
          if (Responsive.isMobile(context))
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  print("I see you forgot your password!!!...");
                },
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          SizedBox(height: 4.h),
          Text(
            '\u00a9 ${DateTime.now().year} SmartLoans Manager',
            style: const TextStyle(
              color: AppColor.inActiveColor,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
