import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_loans/pages/login/bloc/login_bloc.dart';
import 'package:smart_loans/pages/login/widgets/login_initial_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LogInBloc(),
        child: const Center(
          child: LoginInitialWidget(),
        ),
      ),
    );
  }
}
