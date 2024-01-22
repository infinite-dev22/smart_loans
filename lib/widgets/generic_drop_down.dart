// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';
// import 'package:smart_loans/theme/light.dart';
//
// class CustomGenericDropdown<T extends Object> extends StatelessWidget {
//   const CustomGenericDropdown(
//       {super.key,
//       required this.hintText,
//       required this.menuItems,
//       this.onChanged,
//       this.defaultValue});
//
//   final String hintText;
//   final List<T> menuItems;
//   final T? defaultValue;
//   final Function(T?)? onChanged;
//
//   @override
//   Widget build(BuildContext context) {
//     return _buildBody();
//   }
//
//   _buildBody() {
//     return Column(
//       children: [
//         SizedBox(
//           height: 50,
//           child: DropdownButtonFormField2<T>(
//             alignment: Alignment.centerLeft,
//             autovalidateMode: AutovalidateMode.onUserInteraction,
//             value: defaultValue,
//             isExpanded: true,
//             decoration: InputDecoration(
//               contentPadding: const EdgeInsets.symmetric(vertical: 16),
//               filled: true,
//               fillColor: AppColor.textBoxColor,
//               border: OutlineInputBorder(
//                 borderSide: BorderSide.none,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//             ),
//             hint: Text(
//               'Select $hintText',
//               style:
//                   const TextStyle(color: AppColor.inActiveColor, fontSize: 15),
//             ),
//             items: menuItems
//                 .map((item) => DropdownMenuItem<T>(
//                       value: item,
//                       child: Text(
//                         item.getName(),
//                         style: const TextStyle(
//                           fontSize: 14,
//                         ),
//                       ),
//                     ))
//                 .toList(),
//             validator: (value) {
//               if (value == null) {
//                 return 'Please select a $hintText';
//               }
//               return null;
//             },
//             onChanged: onChanged,
//             buttonStyleData: const ButtonStyleData(
//               padding: EdgeInsets.only(right: 8),
//             ),
//             iconStyleData: const IconStyleData(
//               icon: Icon(
//                 Icons.keyboard_arrow_down_rounded,
//                 color: LightAppColor.darker,
//               ),
//               iconSize: 24,
//             ),
//             dropdownStyleData: DropdownStyleData(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15),
//               ),
//             ),
//             menuItemStyleData: const MenuItemStyleData(
//               padding: EdgeInsets.symmetric(horizontal: 16),
//             ),
//           ),
//         ),
//         const SizedBox(height: 10),
//       ],
//     );
//   }
// }
