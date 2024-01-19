import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_loans/config/responsive.dart';
import 'package:smart_loans/pages/clients/bloc/clients_bloc/clients_bloc.dart';
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
    return BlocBuilder<ClientsBloc, ClientsState>(
      builder: (context, state) {
        if (state.status == ClientsStatus.initial) {
          context.read<ClientsBloc>().add(GetClients());
        } else if (state.status == ClientsStatus.success) {
          return Responsive(
            mobile: ClientDetailSuccessMobile(clientId: clientId),
            tablet: ClientDetailSuccessTablet(clientId: clientId),
            desktop: ClientDetailSuccessDesktop(clientId: clientId),
          );
        } else if (state.status == ClientsStatus.loading) {
          return const ClientsLoadingWidget();
        } else if (state.status == ClientsStatus.error) {
          return const ClientsErrorWidget();
        }
        return const ClientsInitialWidget();
      },
    );
  }
}
