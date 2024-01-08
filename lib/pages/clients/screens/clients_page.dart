import 'package:flutter/material.dart';
import 'package:smart_loans/pages/clients/screens/layouts/clients_page_layout.dart';
import 'package:smart_loans/widgets/custom_scaffold.dart';

class ClientsPage extends StatelessWidget {
  const ClientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      route: "/clients",
      body: ClientsPageLayout(),
    );
  }
}
