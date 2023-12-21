import 'package:flutter/material.dart';
import 'package:smart_loans/theme/light.dart';

import '../../../global_values.dart';

class ClientsTitle extends StatelessWidget {
  const ClientsTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        color: LightAppColor.primary,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Clients",
                style: TextStyle(
                    color: LightAppColor.titleText, fontSize: headerFontSize),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
