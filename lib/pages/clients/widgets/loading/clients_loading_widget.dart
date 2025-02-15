import 'package:flutter/cupertino.dart';

class ClientsLoadingWidget extends StatelessWidget {
  const ClientsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CupertinoActivityIndicator(radius: 20),
    );
  }
}
