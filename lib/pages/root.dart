import 'package:easy_dashboard/easy_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:smart_loans/pages/clients/screens/clients_page.dart';
import 'package:smart_loans/theme/colors.dart';

class Root extends StatelessWidget {
  Root({super.key});

  late final EasyAppController controller = EasyAppController(
    intialBody: EasyBody(
        child: const Text("Test Body"), title: const Text("SmartLoans Manager", style: TextStyle(fontSize: 25, color: AppColor.white45),)),
  );

  @override
  Widget build(BuildContext context) {
    return EasyDashboard(
      controller: controller,
      navigationIcon: const Icon(Icons.menu, color: Colors.white),
      appBarActions: [],
      centerTitle: true,
      appBarColor: Colors.teal,
      sideBarColor: Colors.grey.shade100,
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
          iconColor: Colors.teal,
          hoverColor: Colors.grey.shade300,
          tileColor: Colors.grey.shade100,
          selectedColor: Colors.black.withGreen(80),
          selectedIconColor: Colors.white,
          textColor: Colors.black.withGreen(20),
          selectedTileColor: Colors.teal.shade400.withOpacity(.8),
          tiles: _sideTiles(),
          topWidget: SideBox(
            scrollable: true,
            height: 150,
            child: Text("Top Open Widget")/*topOpenWidget*/,
          ),
          bottomWidget: SideBox(
            scrollable: false,
            height: 50,
            child: Text("Bottom Open Widget")/*bottomOpenWidget*/,
          ),
          bottomSmallWidget: SideBox(
            height: 50,
            child: Text("Bottom Small Widget")/*bottomSmallWidget*/,
          ),
          topSmallWidget: SideBox(
            height: 50,
            child: Text("Top Small Widget")/*topSmallWidget*/,
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
        name: "Clients",
        title: const Text("Clients"),
        body: const ClientsPage(),
      ),
    ];
  }
}
