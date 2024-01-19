import 'package:flutter/material.dart';
import 'package:smart_loans/init.dart';
import 'package:smart_loans/pages/clients/screens/layouts/client_details_page_layout.dart';
import 'package:smart_loans/widgets/custom_scaffold.dart';

class ClientDetailsPage extends StatelessWidget {
  const ClientDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    int? clientId;
    if (ModalRoute.of(context)!.settings.arguments != null) {
      clientId = ModalRoute.of(context)!.settings.arguments as int;
      getLocalStorage().write("client_id", clientId);
    } else {
      clientId = getLocalStorage().read("client_id");
    }
    return CustomScaffold(
      route: "/client",
      body: ClientDetailsPageLayout(clientId: clientId!),
    );
  }
}
