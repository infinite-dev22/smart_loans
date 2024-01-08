import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:smart_loans/theme/colors.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    Key? key,
    required this.route,
    required this.body,
  }) : super(key: key);

  final Widget body;
  final String route;

  final List<AdminMenuItem> _sideBarItems = const [
    AdminMenuItem(
      title: 'Dashboard',
      route: '/',
      icon: Icons.dashboard,
    ),
    AdminMenuItem(
      title: 'Clients',
      route: '/clients',
      icon: Icons.dashboard,
    ),
    AdminMenuItem(
      title: 'Employees',
      route: '/employees',
      icon: Icons.dashboard,
    ),
    AdminMenuItem(
      title: 'Loans',
      route: '/loans',
      icon: Icons.dashboard,
    ),
    AdminMenuItem(
      title: 'Top Level',
      icon: Icons.file_copy,
      children: [
        AdminMenuItem(
          title: 'Second Level Item 1',
          route: '/secondLevelItem1',
        ),
        AdminMenuItem(
          title: 'Second Level Item 2',
          route: '/secondLevelItem2',
        ),
        AdminMenuItem(
          title: 'Third Level',
          children: [
            AdminMenuItem(
              title: 'Third Level Item 1',
              route: '/thirdLevelItem1',
            ),
            AdminMenuItem(
              title: 'Third Level Item 2',
              route: '/thirdLevelItem2',
              icon: Icons.image,
            ),
          ],
        ),
      ],
    ),
  ];

  final List<AdminMenuItem> _adminMenuItems = const [
    AdminMenuItem(
      title: 'User Profile',
      icon: Icons.account_circle,
      route: '/',
    ),
    AdminMenuItem(
      title: 'Settings',
      icon: Icons.settings,
      route: '/',
    ),
    AdminMenuItem(
      title: 'Logout',
      icon: Icons.logout,
      route: '/',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        actionsIconTheme: const IconThemeData(color: AppColor.white),
        elevation: 8.0,
        title: const Text('SmartLoans'),
        actions: [
          PopupMenuButton<AdminMenuItem>(
            child: const Icon(Icons.account_circle),
            itemBuilder: (context) {
              return _adminMenuItems.map((AdminMenuItem item) {
                return PopupMenuItem<AdminMenuItem>(
                  value: item,
                  child: Row(
                    children: [
                      Icon(item.icon),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          item.title,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList();
            },
            onSelected: (item) {
              print(
                  'actions: onSelected(): title = ${item.title}, route = ${item.route}');
              Navigator.of(context).pushNamed(item.route!);
            },
          ),
        ],
      ),
      sideBar: SideBar(
        backgroundColor: AppColor.sideBarPrimary,
        activeBackgroundColor: Colors.black38,
        borderColor: AppColor.sideBarPrimary,
        iconColor: Colors.white,
        activeIconColor: Colors.white,
        textStyle: const TextStyle(
          color: Color(0xFF337ab7),
          fontSize: 13,
        ),
        activeTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 13,
        ),
        items: _sideBarItems,
        selectedRoute: route,
        onSelected: (item) {
          print(
              'sideBar: onTap(): title = ${item.title}, route = ${item.route}');
          if (item.route != null && item.route != route) {
            Navigator.of(context).pushNamed(item.route!);
          }
        },
        header: Container(
          height: 50,
          width: double.infinity,
          color: const Color(0xff444444),
          child: const Center(
            child: Text(
              'header',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        footer: Container(
          height: 50,
          width: double.infinity,
          color: const Color(0xff444444),
          child: const Center(
            child: Text(
              'footer',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: body,
    );
  }
}
