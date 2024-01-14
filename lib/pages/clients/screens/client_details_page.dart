import 'package:flutter/material.dart';
import 'package:smart_loans/config/responsive.dart';
import 'package:smart_loans/data_source/models/client_model.dart';
import 'package:smart_loans/pages/clients/widgets/details/client_details_success_widget/mobile.dart';
import 'package:smart_loans/pages/clients/widgets/details/client_details_success_widget/tablet.dart';
import 'package:smart_loans/widgets/custom_scaffold.dart';

import '../widgets/details/client_details_success_widget/desktop.dart';

class ClientDetailsPage extends StatelessWidget {
  const ClientDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var client = ModalRoute.of(context)!.settings.arguments as ClientModel;
    return CustomScaffold(
      route: "/client",
      body: SingleChildScrollView(
        child: Responsive(
          mobile: ClientDetailSuccessMobile(client: client),
          tablet: ClientDetailSuccessTablet(client: client),
          desktop: ClientDetailSuccessDesktop(client: client),
        ),
      ),
    );
  }
}
