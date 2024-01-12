import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_loans/config/responsive.dart';
import 'package:smart_loans/global_values.dart';
import 'package:smart_loans/init.dart';
import 'package:smart_loans/pages/client_types/bloc/client_type_bloc.dart';
import 'package:smart_loans/pages/clients/bloc/client_bloc/client_bloc.dart';
import 'package:smart_loans/pages/clients/bloc/clients_bloc/clients_bloc.dart';
import 'package:smart_loans/pages/clients/bloc/forms/clients/client_add_form_bloc.dart';
import 'package:smart_loans/pages/industry_types/bloc/industry_type_bloc.dart';
import 'package:smart_loans/pages/nations/bloc/nation_bloc.dart';
import 'package:smart_loans/theme/light.dart';
import 'package:smart_loans/widgets/dialog_title_wdiget.dart';

class ClientForm extends StatelessWidget {
  const ClientForm({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildSuccessBody(context);
  }

  Widget _buildSuccessBody(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: (Responsive.isDesktop(context)) ? 30.w : 40.w,
        child: LayoutBuilder(builder: (context, constraints) {
          return Column(
            children: [
              const DialogTitleWidget(text: 'Client Form'),
              Padding(
                padding: EdgeInsets.all(padding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BlocBuilder<ClientTypeBloc, ClientTypeState>(
                      builder: (context, state) {
                        if (state.status == ClientTypeStatus.initial) {
                          context.read<ClientTypeBloc>().add(GetClientTypes());
                          return Container(
                            height: 55,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                              border: Border.all(
                                  width: 1, color: LightAppColor.darker),
                            ),
                            child: const CupertinoActivityIndicator(),
                          );
                        }
                        if (state.status == ClientTypeStatus.success) {
                          return SizedBox(
                            height: 50,
                            child: DropdownButtonFormField2(
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                  ),
                                  label: Text("Client Type")),
                              items: context
                                  .read<ClientTypeBloc>()
                                  .state
                                  .types
                                  ?.map((clientType) => DropdownMenuItem(
                                        value: clientType.id,
                                        child: Text(clientType.name!),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                client.clientTypeId = value;
                                if (value == 1) {
                                  context
                                      .read<ClientAddFormBloc>()
                                      .add(SetIndividual());
                                } else {
                                  context
                                      .read<ClientAddFormBloc>()
                                      .add(SetCompany());
                                }
                              },
                            ),
                          );
                        }
                        if (state.status == ClientTypeStatus.error) {
                          return Container(
                            height: 55,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                              border: Border.all(
                                  width: 1, color: LightAppColor.darker),
                            ),
                            child: const Center(
                              child: Icon(Icons.error_outline_rounded),
                            ),
                          );
                        }
                        return Container(
                          height: 55,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            border: Border.all(
                                width: 1, color: LightAppColor.darker),
                          ),
                          child: const CupertinoActivityIndicator(),
                        );
                      },
                    ),
                    BlocBuilder<ClientAddFormBloc, ClientAddFormState>(
                      builder: (context, state) {
                        if (state.status == ClientAddFormStatus.initial) {
                          context
                              .read<ClientAddFormBloc>()
                              .add(SetIndividual());
                        }
                        if (client.clientTypeId == 1) {
                          context
                              .read<ClientAddFormBloc>()
                              .add(SetIndividual());
                        } else {
                          context.read<ClientAddFormBloc>().add(SetCompany());
                        }
                        if (state.status == ClientAddFormStatus.individual) {
                          return _buildIndividualBody(context, constraints);
                        } else if (state.status ==
                            ClientAddFormStatus.company) {
                          return _buildCompanyBody(context, constraints);
                        } else {
                          return _buildIndividualBody(context, constraints);
                        }
                      },
                    ),
                    BlocBuilder<NationBloc, NationState>(
                      builder: (context, state) {
                        if (state.status == NationStatus.initial) {
                          context.read<NationBloc>().add(GetNations());
                          return Container(
                            height: 55,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                              border: Border.all(
                                  width: 1, color: LightAppColor.darker),
                            ),
                            child: const CupertinoActivityIndicator(),
                          );
                        }
                        if (state.status == NationStatus.success) {
                          return SizedBox(
                            height: 50,
                            child: DropdownButtonFormField2(
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                  ),
                                  label: Text(
                                    "Nationality",
                                  )),
                              items: context
                                  .read<NationBloc>()
                                  .state
                                  .nations
                                  ?.map((clientType) => DropdownMenuItem(
                                        value: clientType.id,
                                        child: Text(clientType.name!),
                                      ))
                                  .toList(),
                              onChanged: (value) => client.nationId = value,
                            ),
                          );
                        }
                        if (state.status == NationStatus.error) {
                          return Container(
                            height: 55,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                              border: Border.all(
                                  width: 1, color: LightAppColor.darker),
                            ),
                            child: const Center(
                              child: Icon(Icons.error_outline_rounded),
                            ),
                          );
                        }
                        return Container(
                          height: 55,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            border: Border.all(
                                width: 1, color: LightAppColor.darker),
                          ),
                          child: const CupertinoActivityIndicator(),
                        );
                      },
                    ),
                    SizedBox(height: 3.h),
                    FilledButton(
                      style: const ButtonStyle(
                        minimumSize: MaterialStatePropertyAll(
                          Size(double.infinity, 50),
                        ),
                      ),
                      child: const Text('Submit'),
                      onPressed: () {
                        context.read<ClientBloc>().add(CreateClient(client));
                        context.read<ClientsBloc>().add(GetClients());
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildIndividualBody(
    BuildContext context,
    BoxConstraints constraints,
  ) {
    return Column(
      children: [
        SizedBox(height: 2.h),
        SizedBox(
          height: 50,
          child: DropdownButtonFormField2(
            decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                label: Text("Salutation")),
            items: context
                .read<ClientAddFormBloc>()
                .state
                .roles
                ?.map((role) => DropdownMenuItem(
                      value: role.id,
                      child: Text(role.name),
                    ))
                .toList(),
            onChanged: (value) {},
          ),
        ),
        SizedBox(height: 2.h),
        SizedBox(
          width: constraints.maxWidth,
          // Make it like Twitter's BootStrap
          child: Wrap(
            children: [
              SizedBox(
                width: constraints.maxWidth * .31,
                height: 50,
                child: TextFormField(
                  decoration: InputDecoration(
                    label: const Text("First Name"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onChanged: (value) => client.firstName = value,
                ),
              ),
              SizedBox(width: 1.h),
              SizedBox(
                width: constraints.maxWidth * .31,
                height: 50,
                child: TextFormField(
                  decoration: InputDecoration(
                    label: const Text("Last Name"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onChanged: (value) => client.lastName = value,
                ),
              ),
              SizedBox(width: 1.h),
              SizedBox(
                width: constraints.maxWidth * .31,
                height: 50,
                child: TextFormField(
                  decoration: InputDecoration(
                    label: const Text("Other Name"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onChanged: (value) => client.otherName = value,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 2.h),
        SizedBox(
          width: constraints.maxWidth,
          child: Row(
            children: [
              SizedBox(
                width: constraints.maxWidth * .475,
                height: 50,
                child: TextFormField(
                  decoration: InputDecoration(
                    label: const Text("Telephone"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onChanged: (value) => client.telephone = value,
                ),
              ),
              SizedBox(width: 1.h),
              SizedBox(
                width: constraints.maxWidth * .475,
                height: 50,
                child: TextFormField(
                  decoration: InputDecoration(
                    label: const Text("Email"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onChanged: (value) => client.email = value,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 2.h),
        SizedBox(
          height: 50,
          child: TextFormField(
            decoration: InputDecoration(
              label: const Text("Occupation"),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onChanged: (value) => client.occupation = value,
          ),
        ),
        SizedBox(height: 2.h),
        SizedBox(
          height: 50,
          child: TextFormField(
            decoration: InputDecoration(
              label: const Text("Address"),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onChanged: (value) => client.address = value,
          ),
        ),
        SizedBox(height: 2.h),
      ],
    );
  }

  Widget _buildCompanyBody(
    BuildContext context,
    BoxConstraints constraints,
  ) {
    return Column(
      children: [
        SizedBox(height: 2.h),
        SizedBox(
          height: 50,
          child: TextFormField(
            decoration: InputDecoration(
              label: const Text("Company Name"),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onChanged: (value) => client.name = value,
          ),
        ),
        SizedBox(height: 2.h),
        BlocBuilder<IndustryTypeBloc, IndustryTypeState>(
          builder: (context, state) {
            if (state.status == IndustryTypeStatus.initial) {
              context.read<IndustryTypeBloc>().add(GetIndustryTypes());
              return Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                  border: Border.all(width: 1, color: LightAppColor.darker),
                ),
                child: const CupertinoActivityIndicator(),
              );
            }
            if (state.status == IndustryTypeStatus.success) {
              return SizedBox(
                height: 50,
                child: DropdownButtonFormField2(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                      ),
                      label: Text("Industry")),
                  items: context
                      .read<IndustryTypeBloc>()
                      .state
                      .types
                      ?.map((industryType) => DropdownMenuItem(
                            value: industryType.id,
                            child: Text(industryType.name!),
                          ))
                      .toList(),
                  onChanged: (value) => client.businessIndustryId = value,
                ),
              );
            }
            if (state.status == IndustryTypeStatus.error) {
              return Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                  border: Border.all(width: 1, color: LightAppColor.darker),
                ),
                child: const Center(
                  child: Icon(Icons.error_outline_rounded),
                ),
              );
            }
            return Container(
              height: 55,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(8.0),
                ),
                border: Border.all(width: 1, color: LightAppColor.darker),
              ),
              child: const CupertinoActivityIndicator(),
            );
          },
        ),
        SizedBox(height: 2.h),
        SizedBox(
          width: constraints.maxWidth,
          child: Row(
            children: [
              SizedBox(
                width: constraints.maxWidth * .475,
                height: 50,
                child: TextFormField(
                  decoration: InputDecoration(
                    label: const Text("Telephone"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onChanged: (value) => client.telephone = value,
                ),
              ),
              SizedBox(width: 1.h),
              SizedBox(
                width: constraints.maxWidth * .475,
                height: 50,
                child: TextFormField(
                  decoration: InputDecoration(
                    label: const Text("Email"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onChanged: (value) => client.email = value,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 2.h),
        SizedBox(
          height: 50,
          child: TextFormField(
            decoration: InputDecoration(
              label: const Text("Tin"),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onChanged: (value) => client.tin = value,
          ),
        ),
        SizedBox(height: 2.h),
        SizedBox(
          height: 50,
          child: TextFormField(
            decoration: InputDecoration(
              label: const Text("Address"),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onChanged: (value) => client.address = value,
          ),
        ),
        SizedBox(height: 2.h),
      ],
    );
  }
}
