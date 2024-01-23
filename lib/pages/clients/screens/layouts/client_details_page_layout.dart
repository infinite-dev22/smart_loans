import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_loans/config/responsive.dart';
import 'package:smart_loans/pages/clients/bloc/client_bloc/client_bloc.dart';
import 'package:smart_loans/pages/clients/widgets/details/client_details_success_widget/desktop.dart';
import 'package:smart_loans/pages/clients/widgets/details/client_details_success_widget/mobile.dart';
import 'package:smart_loans/pages/clients/widgets/details/client_details_success_widget/tablet.dart';
import 'package:smart_loans/pages/clients/widgets/error/clients_error_widget.dart';
import 'package:smart_loans/pages/clients/widgets/initial/client_initial_widget.dart';
import 'package:smart_loans/pages/clients/widgets/loading/clients_loading_widget.dart';

class ClientDetailsPageLayout extends StatelessWidget {
  final int clientId;

  const ClientDetailsPageLayout({
    super.key,
    required this.clientId,
  });

  @override
  Widget build(BuildContext context) {
    var client;
    return BlocBuilder<ClientBloc, ClientState>(
      builder: (context, state) {
        if (state.status == ClientStatus.initial) {
          context.read<ClientBloc>().add(GetClient(clientId));
        } else if (state.status == ClientStatus.success) {
          client = context.read<ClientBloc>().state.client;
          return Responsive(
            mobile: ClientDetailSuccessMobile(client: client),
            tablet: ClientDetailSuccessTablet(client: client),
            desktop: ClientDetailSuccessDesktop(client: client),
          );
        } else if (state.status == ClientStatus.loading) {
          return const ClientsLoadingWidget();
        } else if (state.status == ClientStatus.error) {
          return const ClientsErrorWidget();
        }
        return const ClientsInitialWidget();
      },
    );
  }
}
