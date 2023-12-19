import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget small;
  final Widget medium;
  final Widget large;
  final Widget smallest;

  const Responsive(
      {super.key,
      required this.small,
      required this.medium,
      required this.large,
      required this.smallest});

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 768;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1200 &&
      MediaQuery.of(context).size.width >= 768;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // If our width is more than 1200 then we consider it a desktop
    if (size.width >= 1200) {
      return large;
    }
    // If width it less then 1200 and more then 768 we consider it as tablet
    else if (size.width >= 768) {
      return medium;
    }
    // Or less then that we called it mobile
    else if (size.width >= 376 && size.width <= 768) {
      return small;
    } else {
      return smallest;
    }
  }
}
