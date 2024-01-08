import 'package:flutter/material.dart';
import 'package:smart_loans/data_source/models/client_model.dart';
import 'package:smart_loans/widgets/custom_scaffold.dart';

import '../widgets/details/client_details_success_widget.dart';

class ClientDetailsPage extends StatelessWidget {
  const ClientDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var client = ModalRoute.of(context)!.settings.arguments as ClientModel;
    return CustomScaffold(
      route: "/client",
      body: SingleChildScrollView(
        child: ClientDetailSuccessWidget(client: client),
      ),
    );
  }
}
