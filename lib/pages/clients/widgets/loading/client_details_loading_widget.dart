import 'package:flutter/cupertino.dart';

class ClientDetailsLoadingWidget extends StatelessWidget {
  const ClientDetailsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CupertinoActivityIndicator(radius: 20),
    );
  }
}
