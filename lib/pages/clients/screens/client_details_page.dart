import 'package:flutter/material.dart';
import 'package:smart_loans/widgets/custom_scaffold.dart';

import '../widgets/details/client_details_success_widget.dart';

class ClientDetailsPage extends StatelessWidget {
  const ClientDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      route: "/client",
      body: ClientDetailSuccessWidget(),
    );
  }
}
