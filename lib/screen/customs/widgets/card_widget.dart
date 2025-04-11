// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CardWidget extends StatefulWidget {
//   const CardWidget({super.key});

//   @override
//   State<CardWidget> createState() => _CardWidgetState();
// }

// class _CardWidgetState extends State<CardWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           SizedBox(
//             height: context.height * 0.3,
//             width: double.infinity,
//             child: _cardWidgetState(),
//           ),
//         ],
//       ),
//     );
//   }


//   Widget _cardWidgetState() {
//     return Column(
//       children: [
//         Expanded(
//           child: ListView.builder(
//             itemCount: _categoryModel.categories.length,
//             scrollDirection: Axis.horizontal,
//             itemBuilder: (BuildContext ctx, index) {
//               return Container(
//                 width: 180,
//                 height: 200,
//                 margin: const EdgeInsets.only(right: 10),
//                 decoration: BoxDecoration(
//                   color: Colors.orange,
//                   borderRadius: BorderRadius.all(Radius.circular(20)),
//                   boxShadow: const [
//                     BoxShadow(
//                       color: Colors.black12,
//                       blurRadius: 20,
//                       offset: Offset(0, 5),
//                     ),
//                   ],
//                 ),
//                 child: Text(_categoryModel.categories[index]['name']),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
