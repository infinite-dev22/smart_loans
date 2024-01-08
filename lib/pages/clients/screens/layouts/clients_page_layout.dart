import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_loans/pages/clients/bloc/clients_bloc/clients_bloc.dart';
import 'package:smart_loans/pages/clients/widgets/error/clients_error_widget.dart';
import 'package:smart_loans/pages/clients/widgets/initial/client_initial_widget.dart';
import 'package:smart_loans/pages/clients/widgets/loading/clients_loading_widget.dart';
import 'package:smart_loans/pages/clients/widgets/success/clients_success_widget.dart';

class ClientsPageLayout extends StatelessWidget {
  const ClientsPageLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientsBloc, ClientsState>(
      builder: (context, state) {
        if (state.status == ClientsStatus.initial) {
          context.read<ClientsBloc>().add(GetClients());
        } else if (state.status == ClientsStatus.success) {
          return const SingleChildScrollView(
            child: ClientsSuccessWidget(),
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
