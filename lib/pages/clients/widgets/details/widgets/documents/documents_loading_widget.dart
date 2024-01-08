import 'package:flutter/cupertino.dart';

class DocumentsLoadingWidget extends StatelessWidget {
  const DocumentsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CupertinoActivityIndicator(radius: 20),
    );
  }
}
