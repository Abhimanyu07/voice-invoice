// import 'package:flutter/material.dart';
//
//
// class textInputs extends StatefulWidget {
//
//   textInputs({Key? key, required this.controller,
//   required this.hints, required this.labelText}) : super(key: key);
//   TextEditingController controller = TextEditingController();
//   String hints;
//   String labelText;
//   @override
//   _textInputsState createState() => _textInputsState();
// }
//
// class _textInputsState extends State<textInputs> {
//   @override
//   Widget build(BuildContext context) {
//     return
//       Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: SizedBox(
//
//         width: MediaQuery.of(context).size.width/1.2,
//         child: TextField(
//           controller: controller,
//           decoration: InputDecoration(
//             hintText: widget.hints,
//             hintStyle: const TextStyle(color: Colors.black),
//             label: Text(widget.labelText),
//             labelStyle: const TextStyle(color: Colors.black),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(15),
//               borderSide: const BorderSide(color: Colors.blue)
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: const BorderSide(width: 2,color: Colors.blue)
//             )
//           ),
//
//         ),
//       ),
//     );
//   }
// }
