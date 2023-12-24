import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
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
      ),
    );
  }
}
