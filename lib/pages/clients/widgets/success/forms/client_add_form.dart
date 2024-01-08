import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_loans/config/responsive.dart';
import 'package:smart_loans/global_values.dart';
import 'package:smart_loans/pages/clients/bloc/forms/clients/client_add_form_bloc.dart';
import 'package:smart_loans/widgets/dialog_title_wdiget.dart';

class ClientForm extends StatelessWidget {
  const ClientForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientAddFormBloc, ClientAddFormState>(
      builder: (context, state) {
        if (state.status == ClientAddFormStatus.initial) {
          context.read<ClientAddFormBloc>().add(GetRoles());
          return _buildLoadBody(context);
        }
        if (state.status == ClientAddFormStatus.success) {
          return _buildSuccessBody(context);
        }
        if (state.status == ClientAddFormStatus.error) {
          return _buildErrorBody(context);
        }
        return _buildLoadBody(context);
      },
    );
  }

  Widget _buildSuccessBody(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: (Responsive.isDesktop(context)) ? 25.w : 40.w,
        child: Column(
          children: [
            const DialogTitleWidget(text: 'Client Form'),
            Padding(
              padding: EdgeInsets.all(padding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: const Text("First Name"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 1.h),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: const Text("Last Name"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 1.h),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: const Text("Other Name"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 1.h),
                  SizedBox(
                    child: DropdownButtonFormField2(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                          label: Text("Designations")),
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
                  SizedBox(height: 1.h),
                  SizedBox(
                    height: 50,
                    child: DropdownButtonFormField2(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                          label: Text("Gender")),
                      items: const [
                        DropdownMenuItem(
                          value: 1,
                          child: Text("Male"),
                        ),
                        DropdownMenuItem(
                          value: 2,
                          child: Text("Female"),
                        ),
                      ],
                      onChanged: (value) {},
                    ),
                  ),
                  SizedBox(height: 1.h),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: const Text("Email"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 1.h),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: const Text("Telephone"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 1.h),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: const Text("Address"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  FilledButton(
                    style: const ButtonStyle(
                      minimumSize: MaterialStatePropertyAll(
                        Size(double.infinity, 50),
                      ),
                    ),
                    child: const Text('Submit'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadBody(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: (Responsive.isDesktop(context)) ? 25.w : 40.w,
        child: Column(
          children: [
            const DialogTitleWidget(text: 'Client Form'),
            Padding(
              padding: EdgeInsets.all(padding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: const Text("First Name"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 1.h),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: const Text("Last Name"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 1.h),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: const Text("Other Name"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 1.h),
                  SizedBox(
                    height: 50,
                    child: DropdownButtonFormField2(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                          label: Text("Designations")),
                      items: [],
                      onChanged: (value) {},
                    ),
                  ),
                  SizedBox(height: 1.h),
                  SizedBox(
                    height: 50,
                    child: DropdownButtonFormField2(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                          label: Text("Gender")),
                      items: const [
                        DropdownMenuItem(
                          value: 1,
                          child: Text("Male"),
                        ),
                        DropdownMenuItem(
                          value: 2,
                          child: Text("Female"),
                        ),
                      ],
                      onChanged: (value) {},
                    ),
                  ),
                  SizedBox(height: 1.h),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: const Text("Email"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 1.h),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: const Text("Telephone"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 1.h),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: const Text("Address"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  FilledButton(
                    style: const ButtonStyle(
                      minimumSize: MaterialStatePropertyAll(
                        Size(double.infinity, 50),
                      ),
                    ),
                    child: const Text('Submit'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorBody(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: (Responsive.isDesktop(context)) ? 25.w : 40.w,
        child: Column(
          children: [
            const DialogTitleWidget(text: 'Client Form'),
            Padding(
              padding: EdgeInsets.all(padding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: const Text("First Name"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 1.h),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: const Text("Last Name"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 1.h),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: const Text("Other Name"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 1.h),
                  SizedBox(
                    height: 50,
                    child: DropdownButtonFormField2(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                          label: Text("Designations")),
                      items: [],
                      onChanged: (value) {},
                    ),
                  ),
                  SizedBox(height: 1.h),
                  SizedBox(
                    height: 50,
                    child: DropdownButtonFormField2(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                          label: Text("Gender")),
                      items: const [
                        DropdownMenuItem(
                          value: 1,
                          child: Text("Male"),
                        ),
                        DropdownMenuItem(
                          value: 2,
                          child: Text("Female"),
                        ),
                      ],
                      onChanged: (value) {},
                    ),
                  ),
                  SizedBox(height: 1.h),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: const Text("Email"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 1.h),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: const Text("Telephone"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 1.h),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: const Text("Address"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  FilledButton(
                    style: const ButtonStyle(
                      minimumSize: MaterialStatePropertyAll(
                        Size(double.infinity, 50),
                      ),
                    ),
                    child: const Text('Submit'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
