import 'package:easy_dashboard/easy_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:smart_loans/pages/clients/screens/clients_page.dart';
import 'package:smart_loans/pages/employees/screens/employees_page.dart';
import 'package:smart_loans/pages/loans/screens/loans_page.dart';
import 'package:smart_loans/theme/colors.dart';

import 'dashboard/screens/dashboard.dart';

class Root extends StatelessWidget {
  Root({super.key});

  late final EasyAppController controller = EasyAppController(
    intialBody: EasyBody(
        child: const DashboardPage(),
        title: const Text(
          "SmartLoans Manager",
          style: TextStyle(fontSize: 25, color: AppColor.white45),
        )),
  );

  @override
  Widget build(BuildContext context) {
    return EasyDashboard(
      controller: controller,
      navigationIcon: const Icon(Icons.menu, color: Colors.white),
      appBarActions: [],
      centerTitle: true,
      appBarColor: AppColor.primary,
      sideBarColor: AppColor.sideBarPrimary,
      tabletView: const TabletView(
        fullAppBar: false,
        border: BorderSide(width: 0.5, color: Colors.grey),
      ),
      desktopView: const DesktopView(
        fullAppBar: true,
        border: BorderSide(width: 0.5, color: Colors.grey),
      ),
      drawer: (Size size, Widget? child) {
        return EasyDrawer(
          iconColor: AppColor.sideBarIcon,
          hoverColor: Colors.grey.shade300.withOpacity(.3),
          tileColor: AppColor.sideBarPrimary,
          selectedColor: AppColor.sideBarIcon,
          selectedIconColor: AppColor.sideBarIcon,
          textColor: AppColor.sideBarTileText,
          selectedTileColor: AppColor.sideBarSelectedTile,
          tiles: _sideTiles(),
          topWidget: SideBox(
            scrollable: true,
            height: 150,
            child: Text("Top Open Widget") /*topOpenWidget*/,
          ),
          bottomWidget: SideBox(
            scrollable: false,
            height: 50,
            child: Text("Bottom Open Widget") /*bottomOpenWidget*/,
          ),
          bottomSmallWidget: SideBox(
            height: 50,
            child: Text("Bottom Small Widget") /*bottomSmallWidget*/,
          ),
          topSmallWidget: SideBox(
            height: 50,
            child: Text("Top Small Widget") /*topSmallWidget*/,
          ),
          size: size,
          onTileTapped: (body) {
            controller.switchBody(body);
          },
        );
      },
    );
  }

  List<SideTile> _sideTiles() {
    return <SideTile>[
      SideBarTile(
        icon: Icons.people_alt_rounded,
        name: "Dashboard",
        title: const Text("Dashboard"),
        body: const DashboardPage(),
      ),
      SideBarTile(
        icon: Icons.people_alt_rounded,
        name: "Clients",
        title: const Text("Clients"),
        body: const ClientsPage(),
      ),
      SideBarTile(
        icon: Icons.people_alt_rounded,
        name: "Employees",
        title: const Text("Employees"),
        body: const EmployeesPage(),
      ),
      SideBarTile(
        icon: Icons.people_alt_rounded,
        name: "Loans",
        title: const Text("Loans"),
        body: const LoansPage(),
      ),
    ];
  }
}
