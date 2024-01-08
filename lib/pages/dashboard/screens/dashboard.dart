import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_loans/widgets/custom_scaffold.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      route: "/dashboard",
      body: SingleChildScrollView(
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        Card(
          child: SizedBox(
            height: 8.h,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("You're logged in!", style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
