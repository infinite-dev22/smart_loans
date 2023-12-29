import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_loans/pages/clients/bloc/client_bloc.dart';
import 'package:smart_loans/pages/clients/widgets/error/clients_error_widget.dart';
import 'package:smart_loans/pages/clients/widgets/initial/client_details_error_widget.dart';
import 'package:smart_loans/pages/clients/widgets/loading/clients_loading_widget.dart';
import 'package:smart_loans/pages/clients/widgets/success/clients_success_widget.dart';
import 'package:smart_loans/widgets/custom_scaffold.dart';

class ClientsPage extends StatefulWidget {
  const ClientsPage({super.key});

  @override
  State<ClientsPage> createState() => _ClientsPageState();
}

class _ClientsPageState extends State<ClientsPage> {
  final clientsBloc = ClientBloc();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      route: "/clients",
      // Call bloc on flutter.
      body: BlocBuilder<ClientBloc, ClientState>(
        bloc: clientsBloc,
        builder: (context, state) {
          if (state is ClientsSuccess) {
            return const ClientsSuccessWidget();
          } else if (state is ClientsLoading) {
            return const ClientsLoadingWidget();
          } else if (state is ClientsError) {
            return const ClientsErrorWidget();
          } else if (state is ClientNoData) {
            return const ClientsInitialWidget();
          } else {
            // For now lets just show the data screen as initial screen.
            // return const ClientsInitialWidget();
            return const ClientsSuccessWidget();
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();

    clientsBloc.close();
  }
}
