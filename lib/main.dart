import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_loans/pages/clients/screens/client_details_page.dart';
import 'package:smart_loans/pages/clients/screens/clients_page.dart';
import 'package:smart_loans/pages/dashboard/screens/dashboard.dart';
import 'package:smart_loans/pages/employees/screens/employee_details_page.dart';
import 'package:smart_loans/pages/employees/screens/employees_page.dart';
import 'package:smart_loans/pages/loans/screens/loan_details_page.dart';
import 'package:smart_loans/pages/loans/screens/loans_page.dart';
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
        title: 'Sample',
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
                    child: child,
                  );
                });
          }
          return null;
        },
      ),
    );
  }

  Widget? _getPageWidget(RouteSettings settings) {
    if (settings.name == null) {
      return null;
    }
    final uri = Uri.parse(settings.name!);
    switch (uri.path) {
      case '/':
        return const DashboardPage();
      case '/clients':
        return const ClientsPage();
      case '/client':
        return const ClientDetailsPage();
      case '/employees':
        return const EmployeesPage();
      case '/employee':
        return const EmployeeDetailsPage();
      case '/loans':
        return const LoansPage();
      case '/loan':
        return const LoanDetailsPage();
    }
    return null;
  }
}
