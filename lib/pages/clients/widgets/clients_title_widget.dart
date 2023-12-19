import 'package:flutter/material.dart';
import 'package:smart_loans/theme/light.dart';

class ClientsTitle extends StatelessWidget {
  const ClientsTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return Container(
      color: LightAppColor.primary,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Clients"),
        ],
      ),
    );
  }
}
