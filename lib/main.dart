import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_loans/global_values.dart';
import 'package:smart_loans/pages/clients/bloc/client_bloc/client_bloc.dart';
import 'package:smart_loans/pages/clients/bloc/clients_bloc/clients_bloc.dart';
import 'package:smart_loans/pages/clients/bloc/forms/clients/client_add_form_bloc.dart';
import 'package:smart_loans/pages/clients/screens/client_details_page.dart';
import 'package:smart_loans/pages/clients/screens/clients_page.dart';
import 'package:smart_loans/pages/dashboard/screens/dashboard.dart';
import 'package:smart_loans/pages/employees/bloc/employee_bloc.dart';
import 'package:smart_loans/pages/employees/screens/employee_details_page.dart';
import 'package:smart_loans/pages/employees/screens/employees_page.dart';
import 'package:smart_loans/pages/loans/bloc/loan_bloc.dart';
import 'package:smart_loans/pages/loans/screens/loan_details_page.dart';
import 'package:smart_loans/pages/loans/screens/loans_page.dart';
import 'package:smart_loans/pages/login/screens/login_page.dart';
import 'package:smart_loans/theme/colors.dart';

void main() {
  runApp(const SmartLoansApp());
}

class SmartLoansApp extends StatefulWidget {
  const SmartLoansApp({super.key});

  @override
  State<SmartLoansApp> createState() => _SmartLoansAppState();
}

class _SmartLoansAppState extends State<SmartLoansApp> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SmartLoans Manager',
        theme: ThemeData(
          primaryColor: AppColor.primary,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: (settings) {
          final page = _getPageWidget(settings);
          if (page != null) {
            return PageRouteBuilder(
                settings: settings,
                pageBuilder: (_, __, ___) => page,
                transitionsBuilder: (_, anim, __, child) {
                  return FadeTransition(
                    opacity: anim,
                    child: MultiBlocProvider(
                      providers: [
                        BlocProvider<ClientsBloc>(
                          create: (_) => ClientsBloc(),
                        ),
                        BlocProvider<ClientBloc>(
                          create: (_) => ClientBloc(),
                        ),
                        BlocProvider<EmployeeBloc>(
                          create: (_) => EmployeeBloc(),
                        ),
                        BlocProvider<LoanBloc>(
                          create: (_) => LoanBloc(),
                        ),
                      ],
                      child: child,
                    ),
                  );
                });
          }
          return null;
        },
        home: const LoginPage(),
      ),
    );
  }

  Widget? _getPageWidget(RouteSettings settings) {
    if (settings.name == null) {
      return null;
    }
    final uri = Uri.parse(settings.name!);
    switch (uri.path) {
      case '/dashboard':
        currentRoute = '/dashboard';
        return const DashboardPage();
      case '/clients':
        currentRoute = '/clients';
        return const ClientsPage();
      case '/client':
        currentRoute = '/client';
        return const ClientDetailsPage();
      case '/employees':
        currentRoute = '/employees';
        return const EmployeesPage();
      case '/employee':
        currentRoute = '/employee';
        return const EmployeeDetailsPage();
      case '/loans':
        currentRoute = '/loans';
        return const LoansPage();
      case '/loan':
        currentRoute = '/loan';
        return const LoanDetailsPage();
    }
    return null;
  }
}
