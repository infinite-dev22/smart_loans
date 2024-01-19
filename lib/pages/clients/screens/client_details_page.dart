import 'package:flutter/material.dart';
import 'package:smart_loans/config/responsive.dart';
import 'package:smart_loans/init.dart';
import 'package:smart_loans/pages/clients/widgets/details/client_details_success_widget/desktop.dart';
import 'package:smart_loans/pages/clients/widgets/details/client_details_success_widget/mobile.dart';
import 'package:smart_loans/pages/clients/widgets/details/client_details_success_widget/tablet.dart';
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
      body: SingleChildScrollView(
        child: Responsive(
          mobile: ClientDetailSuccessMobile(clientId: clientId!),
          tablet: ClientDetailSuccessTablet(clientId: clientId),
          desktop: ClientDetailSuccessDesktop(clientId: clientId),
        ),
      ),
    );
  }
}
