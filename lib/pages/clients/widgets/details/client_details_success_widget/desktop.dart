import 'dart:math';

import 'package:flutter/foundation.dart';
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
import 'package:smart_loans/pages/clients/widgets/success/forms/client_form.dart';
import 'package:smart_loans/pages/industry_types/bloc/industry_type_bloc.dart';
import 'package:smart_loans/pages/loans/widgets/details/loan_officer_widget.dart';
import 'package:smart_loans/pages/nations/bloc/nation_bloc.dart';
import 'package:smart_loans/theme/colors.dart';
import 'package:smart_loans/widgets/subtitle_widget.dart';
import 'package:smart_loans/widgets/title_widget.dart';
import 'package:smart_loans/widgets/title_with_actions.dart';

class ClientDetailSuccessDesktop extends StatelessWidget {
  const ClientDetailSuccessDesktop({
    super.key,
    required this.client,
  });

  final ClientModel client;

  @override
  Widget build(BuildContext context) {
    return _buildBody(context, client);
  }

  Widget _buildBody(BuildContext context, ClientModel client) {
    return SingleChildScrollView(
        child: Column(
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
                              onPressed: () {},
                              tooltip: "Process client",
                              icon: const Icon(
                                Icons.recycling_rounded,
                                color: AppColor.white,
                              )),
                          IconButton(
                            onPressed: () => _buildAddForm(context),
                            tooltip: "Add client",
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
                              Stack(
                                children: [
                                  ProfilePhoto(
                                    totalWidth: 10.h,
                                    color: AppColor.white45,
                                    name: client.name!,
                                    outlineColor:
                                        colors[Random().nextInt(colors.length)],
                                  ),
                                  if (kDebugMode)
                                    Positioned(
                                        right: -5,
                                        top: -5,
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.edit_rounded,
                                            color: AppColor.white,
                                          ),
                                        ))
                                ],
                              ),
                              SizedBox(width: 1.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TitleWidget(text: client.name!),
                                  SubTitleWidget(
                                      text: client.clientType!.name!),
                                  Text(client.number!),
                                  Text(client.id.toString()),
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
            SizedBox(width: 1.w),
            const RightSideWidget(),
          ],
        ),
      ],
    ));
  }

  Widget _buildTabs(client) {
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
                _buildClientMoreDetails(client),
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

  Widget _buildClientMoreDetails( ClientModel client) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("First Name: "),
                  Text("Last Name: "),
                  Text("Other Name: "),
                  Text("Nationality: "),
                  Text("City: "),
                  Text("Address: "),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    client.firstName ?? '',
                    style: TextStyle(
                      color: AppColor.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                      client.lastName ?? '',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    client.otherName ?? '',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                     client.nation?.name ?? '',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  Text(
                    client.address ?? '',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    client.address ?? '',
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
          // if (client.documents!.isEmpty) {
            return const DocumentsInitialWidget();
          // }
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

  _buildAddForm(BuildContext parentContext) async {
    return showDialog(
      context: parentContext,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(circularRadius),
          ),
          child: MultiBlocProvider(
              providers: [
                BlocProvider<ClientsBloc>(
                  create: (_) => ClientsBloc(),
                ),
                BlocProvider<ClientBloc>(
                  create: (_) => ClientBloc(),
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
              ],
              child: ClientForm(
                clientId: client.id,
                parentContext: parentContext,
              )),
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
    return Padding(
      padding: EdgeInsets.only(right: padding),
      child: LoanOfficerWidget(width: 16.w),
    );
  }
}
