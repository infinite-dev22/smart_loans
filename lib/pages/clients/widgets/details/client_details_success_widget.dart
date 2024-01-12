import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile_photo/profile_photo.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_loans/config/responsive.dart';
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
import 'package:smart_loans/pages/nations/bloc/nation_bloc.dart';
import 'package:smart_loans/theme/colors.dart';
import 'package:smart_loans/widgets/subtitle_widget.dart';
import 'package:smart_loans/widgets/title_widget.dart';

class ClientDetailSuccessWidget extends StatefulWidget {
  const ClientDetailSuccessWidget({
    super.key,
    required this.client,
  });

  final ClientModel client;

  @override
  State<ClientDetailSuccessWidget> createState() =>
      _ClientDetailSuccessWidgetState();
}

class _ClientDetailSuccessWidgetState extends State<ClientDetailSuccessWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientsBloc, ClientsState>(
      builder: (context, state) {
        return _buildBody();
      },
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: SizedBox(
                width: (Responsive.isDesktop(context))
                    ? 60.w
                    : (Responsive.isTablet(context))
                        ? 75.w
                        : (Responsive.isMobile(context))
                            ? 95.w
                            : 100.w,
                // Remove in favour of responsiveness.
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
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(padding),
                            child: const Text(
                              "Client Details",
                              style: TextStyle(
                                fontSize: 20,
                                color: AppColor.white,
                              ),
                            ),
                          ),
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
                                name: widget.client.name!,
                                outlineColor:
                                    colors[Random().nextInt(colors.length)],
                              ),
                              SizedBox(width: 1.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TitleWidget(text: widget.client.name!),
                                  SubTitleWidget(
                                      text: widget.client.clientType!.name!),
                                  Text(widget.client.number!),
                                  Text(widget.client.telephone!),
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
                      child: _buildTabs(),
                    ),
                  ],
                ),
              ),
            ),
            if (Responsive.isDesktop(context)) SizedBox(width: 1.w),
            if (Responsive.isDesktop(context)) const RightSideWidget(),
          ],
        ),
        if (Responsive.isTablet(context) || Responsive.isMobile(context))
          const RightSideWidget(),
      ],
    );
  }

  Widget _buildTabs() {
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
                _buildClientLoanDocumentDetails(),
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

  Widget _buildClientLoanDocumentDetails() {
    return BlocBuilder<ClientBloc, ClientState>(
      builder: (context, state) {
        if (state.status == ClientStatus.initial) {
          context.read<ClientBloc>().add(GetClientDocuments(widget
              .client)); // TODO: Remove when api gets end points for documents.
        }
        if (state.status == ClientStatus.success) {
          if (widget.client.documents!.isEmpty) {
            return const DocumentsInitialWidget();
          }
          return LoanDocumentsSuccessWidget(
              documents: widget.client.documents!);
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
}

class RightSideWidget extends StatelessWidget {
  const RightSideWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.all(padding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FilledButton(
                onPressed: () {},
                child: const Text("Edit Client"),
              ),
              SizedBox(width: 1.w),
              FilledButton(
                onPressed: () {},
                child: const Text("List"),
              ),
              SizedBox(width: 1.w),
              FilledButton(
                onPressed: () {},
                child: const Text("Convert"),
              ),
              SizedBox(width: 1.w),
              FilledButton(
                onPressed: () => _buildAddForm(context),
                child: const Text("Add Client"),
              ),
              SizedBox(width: 1.w),
            ],
          ),
        ),
        Card(
          child: SizedBox(
            width: (Responsive.isDesktop(context))
                ? 25.w
                : (Responsive.isTablet(context))
                    ? 75.w
                    : (Responsive.isMobile(context))
                        ? 95.w
                        : 100.w,
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
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(padding),
                        child: const Text(
                          "Loans Officer",
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColor.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(padding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ProfilePhoto(
                        totalWidth: 5.h,
                        color: AppColor.white45,
                      ),
                      SizedBox(width: 1.w),
                      const Text("Valeria Konarld"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        if (!Responsive.isDesktop(context)) SizedBox(height: 30.h),
      ],
    );
  }

  _buildAddForm(BuildContext context) async {
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
              create: (_) => ClientsBloc(),
            ),
            BlocProvider<ClientBloc>(
              create: (_) => ClientBloc(),
            ),
            BlocProvider<ClientAddFormBloc>(
              create: (_) => ClientAddFormBloc(),
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
