import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile_photo/profile_photo.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_loans/data_source/models/client_model.dart';
import 'package:smart_loans/global_values.dart';
import 'package:smart_loans/pages/client_types/bloc/client_type_bloc.dart';
import 'package:smart_loans/pages/clients/bloc/client_bloc/client_bloc.dart';
import 'package:smart_loans/pages/clients/bloc/clients_bloc/clients_bloc.dart';
import 'package:smart_loans/pages/clients/bloc/forms/clients/client_add_form_bloc.dart';
import 'package:smart_loans/pages/clients/widgets/details/widgets/documents/documents_error_widget.dart';
import 'package:smart_loans/pages/clients/widgets/details/widgets/documents/documents_initial_widget.dart';
import 'package:smart_loans/pages/clients/widgets/details/widgets/documents/documents_loading_widget.dart';
import 'package:smart_loans/pages/clients/widgets/details/widgets/documents/documents_success_widget.dart';
import 'package:smart_loans/pages/clients/widgets/error/clients_error_widget.dart';
import 'package:smart_loans/pages/clients/widgets/initial/client_initial_widget.dart';
import 'package:smart_loans/pages/clients/widgets/loading/clients_loading_widget.dart';
import 'package:smart_loans/pages/clients/widgets/success/forms/client_form.dart';
import 'package:smart_loans/pages/industry_types/bloc/industry_type_bloc.dart';
import 'package:smart_loans/pages/loans/widgets/details/loan_officer_widget.dart';
import 'package:smart_loans/pages/nations/bloc/nation_bloc.dart';
import 'package:smart_loans/theme/colors.dart';
import 'package:smart_loans/widgets/subtitle_widget.dart';
import 'package:smart_loans/widgets/title_widget.dart';
import 'package:smart_loans/widgets/title_with_actions.dart';

class ClientDetailSuccessMobile extends StatelessWidget {
  const ClientDetailSuccessMobile({
    super.key,
    required this.clientId,
  });

  final int clientId;

  @override
  Widget build(BuildContext context) {
    var client;
    return BlocBuilder<ClientBloc, ClientState>(
      builder: (context, state) {
        if (state.status == ClientStatus.initial) {
          context.read<ClientBloc>().add(GetClient(clientId));
        } else if (state.status == ClientStatus.success) {
          client = context.read<ClientBloc>().state.client;
          return SingleChildScrollView(child: _buildBody(context, client));
        } else if (state.status == ClientStatus.loading) {
          return const ClientsLoadingWidget();
        } else if (state.status == ClientStatus.error) {
          return const ClientsErrorWidget();
        }
        return const ClientsInitialWidget();
      },
    );
  }

  Widget _buildBody(BuildContext context, ClientModel client) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Card(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColor.primary,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(circularRadius),
                          topRight: Radius.circular(circularRadius),
                        ),
                      ),
                      child: TitleBarWithActions(
                        title: "Client",
                        actions: [
                          IconButton(
                              tooltip: "Edit client",
                              onPressed: () => _buildAddForm(context),
                              icon: const Icon(
                                Icons.edit_rounded,
                                color: AppColor.white,
                              )),
                          IconButton(
                              tooltip: "Process client",
                              onPressed: () {},
                              icon: const Icon(
                                Icons.recycling_rounded,
                                color: AppColor.white,
                              )),
                          IconButton(
                            tooltip: "Add client",
                            onPressed: () => _buildAddForm(context),
                            icon: const Icon(
                              Icons.add,
                              color: AppColor.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(padding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ProfilePhoto(
                                totalWidth: 10.h,
                                color: AppColor.white45,
                                name: client.name!,
                                outlineColor:
                                    colors[Random().nextInt(colors.length)],
                              ),
                              SizedBox(width: 1.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TitleWidget(text: client.name!),
                                  SubTitleWidget(
                                      text: client.clientType!.name!),
                                  Text(client.number!),
                                  Text(client.telephone!),
                                ],
                              ),
                            ],
                          ),
                          FilledButton(
                            onPressed: () {},
                            child: const Text("Add Image"),
                          ),
                        ],
                      ),
                    ),
                    DefaultTabController(
                      length: 5,
                      child: _buildTabs(client),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const RightSideWidget(),
      ],
    );
  }

  Widget _buildTabs(ClientModel client) {
    return Column(
      children: [
        const TabBar(
          tabs: [
            Tab(
              child: Text("More Details"),
            ),
            Tab(
              child: Text("Documents"),
            ),
            Tab(
              child: Text("Loans"),
            ),
            Tab(
              child: Text("Next of Kin"),
            ),
            Tab(
              child: Text("Guarantor"),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: padding),
          child: SizedBox(
            height: 72.h,
            child: TabBarView(
              children: [
                _buildClientMoreDetails(),
                _buildClientLoanDocumentDetails(client),
                const Icon(Icons.directions_bike),
                const Icon(Icons.directions_bike),
                const Icon(Icons.directions_bike),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildClientMoreDetails() {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("First Name: "),
                  Text("Last Name: "),
                  Text("Other Name: "),
                  Text("Nationality: "),
                  Text("Business Type: "),
                  Text("City: "),
                  Text("Address: "),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "0000001",
                    style: TextStyle(
                      color: AppColor.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Vicent Company",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "12295200000",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Kampala",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "APPROVED (4.12.2023)",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "LV2",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Address",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              FilledButton(
                onPressed: () {},
                child: const Text("Add Details"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildClientLoanDocumentDetails(ClientModel client) {
    return BlocBuilder<ClientBloc, ClientState>(
      builder: (context, state) {
        if (state.status == ClientStatus.initial) {
          context.read<ClientBloc>().add(GetClientDocuments(
              client)); // TODO: Remove when api gets end points for documents.
        }
        if (state.status == ClientStatus.success) {
          if (client.documents!.isEmpty) {
            return const DocumentsInitialWidget();
          }
          return LoanDocumentsSuccessWidget(documents: client.documents!);
        }
        if (state.status == ClientStatus.loading) {
          return const DocumentsLoadingWidget();
        }
        if (state.status == ClientStatus.error) {
          return const DocumentsErrorWidget();
        }
        return const DocumentsInitialWidget();
      },
    );
  }

  _buildAddForm(BuildContext context) async {
    final clientBloc = ClientBloc();
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(circularRadius),
          ),
          child: MultiBlocProvider(providers: [
            BlocProvider<ClientsBloc>(
              create: (_) => ClientsBloc(clientBloc: clientBloc),
            ),
            BlocProvider<ClientBloc>(
              create: (_) => clientBloc,
            ),
            BlocProvider<ClientFormBloc>(
              create: (_) => ClientFormBloc(),
            ),
            BlocProvider<ClientTypeBloc>(
              create: (_) => ClientTypeBloc(),
            ),
            BlocProvider<NationBloc>(
              create: (_) => NationBloc(),
            ),
            BlocProvider<IndustryTypeBloc>(
              create: (_) => IndustryTypeBloc(),
            ),
          ], child: const ClientForm()),
        );
      },
    );
  }
}

class RightSideWidget extends StatelessWidget {
  const RightSideWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const LoanOfficerWidget();
  }
}
