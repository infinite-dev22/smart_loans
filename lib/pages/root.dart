import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:measured_size/measured_size.dart';
import 'package:smart_loans/config/responsive.dart';
import 'package:smart_loans/pages/clients/screens/clients_page.dart';
import 'package:smart_loans/pages/dashboard/screens/dashboard.dart';
import 'package:smart_loans/pages/employees/screens/employees_page.dart';
import 'package:smart_loans/pages/loans/screens/loans_page.dart';

import 'clients/screens/client_details_page.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  late List<CollapsibleItem> _items;
  late List<Map<String, dynamic>> _screens;
  late Widget currentScreen;
  late Size sideNavSize;

  @override
  void initState() {
    super.initState();
    _items = _generateItems;
    _screens = _generatedWidgets;
    currentScreen =
        _screens.firstWhere((item) => item["name"] == "dashboard")["widget"];
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: MeasuredSize(
        onChange: (Size size) {
          setState(() {
            sideNavSize = size;
          });
        },
        child: CollapsibleSidebar(
          isCollapsed:
              Responsive.isTablet(context) || Responsive.isMobile(context),
          collapseOnBodyTap: Responsive.isTablet(context),
          items: _items,
          title: 'Mark Jonathan',
          body: _body(size, sideNavSize, context),
        ),
      ),
    );
  }

  List<CollapsibleItem> get _generateItems {
    return [
      CollapsibleItem(
        text: 'dashboard',
        icon: Icons.assessment,
        onPressed: () => setState(() => currentScreen = _screens
            .firstWhere((item) => item["name"] == "dashboard")["widget"]),
        onHold: () => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text("Dashboard"),
          ),
        ),
        isSelected: true,
      ),
      CollapsibleItem(
        text: 'clients',
        icon: Icons.search,
        onPressed: () => setState(() => currentScreen =
            _screens.firstWhere((item) => item["name"] == "clients")["widget"]),
        onHold: () => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text("Clients"),
          ),
        ),
      ),
      CollapsibleItem(
        text: 'employees',
        icon: Icons.notifications,
        onPressed: () => setState(() => currentScreen = _screens
            .firstWhere((item) => item["name"] == "employees")["widget"]),
        onHold: () => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text("Employees"),
          ),
        ),
      ),
      CollapsibleItem(
        text: 'loans',
        icon: Icons.settings,
        onPressed: () => setState(() => currentScreen =
            _screens.firstWhere((item) => item["name"] == "loans")["widget"]),
        onHold: () => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text("Loans"),
          ),
        ),
      ),
    ];
  }

  List<Map<String, dynamic>> get _generatedWidgets {
    return [
      {
        "name": "dashboard",
        "widget": const DashboardPage(),
      },
      {
        "name": "clients",
        "widget": const ClientsPage(),
      },
      {
        "name": "client_details",
        "widget": const ClientDetailsPage(),
      },
      {
        "name": "employees",
        "widget": const EmployeesPage(),
      },
      {
        "name": "loans",
        "widget": const LoansPage(),
      },
    ];
  }

  Widget _body(Size size, Size sideNavSize, BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.blueGrey[50],
      child: Center(
        child: SizedBox(
          width: size.width - (sideNavSize.width + 20),
          height: size.height,
          child: currentScreen,
        ),
      ),
    );
  }
}
