import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_loans/pages/clients/bloc/client_bloc.dart';
import 'package:smart_loans/pages/clients/widgets/error/clients_error_widget.dart';
import 'package:smart_loans/pages/clients/widgets/initial/client_initial_widget.dart';
import 'package:smart_loans/pages/clients/widgets/loading/clients_loading_widget.dart';
import 'package:smart_loans/pages/clients/widgets/success/clients_success_widget.dart';

class ClientsPageLayout extends StatelessWidget {
  const ClientsPageLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientBloc, ClientState>(
      builder: (context, state) {
        if (state.status == ClientStatus.initial) {
          context.read<ClientBloc>().add(GetClients());
        } else if (state.status == ClientStatus.success) {
          return const ClientsSuccessWidget();
        } else if (state.status == ClientStatus.loading) {
          return const ClientsLoadingWidget();
        } else if (state.status == ClientStatus.loading) {
          return const ClientsErrorWidget();
        }
        return const ClientsInitialWidget();
      },
    );
  }
}
