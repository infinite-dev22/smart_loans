import 'package:flutter/material.dart';
import 'package:smart_loans/pages/clients/widgets/clients_title_widget.dart';
import 'package:smart_loans/theme/light.dart';

import 'clients_table_widget.dart';

class ClientSuccessWidgetLayout extends StatelessWidget {
  const ClientSuccessWidgetLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: LightAppColor.cardBg,
            spreadRadius: .5,
            blurRadius: 1,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClientsTitle(),
          ClientsTableWidget(),
        ],
      ),
    );
  }
}
