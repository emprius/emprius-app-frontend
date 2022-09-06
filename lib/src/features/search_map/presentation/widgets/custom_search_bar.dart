// import 'package:flutter/material.dart';
// import 'package:material_floating_search_bar/material_floating_search_bar.dart';
//
// class CustomSearchbar extends StatefulWidget {
//   const CustomSearchbar({Key? key}) : super(key: key);
//
//   @override
//   State<CustomSearchbar> createState() => _CustomSearchbarState();
// }
//
// class _CustomSearchbarState extends State<CustomSearchbar> {
//   @override
//   Widget build(BuildContext context) {
//     return FloatingSearchBar(
//       hint: 'Busca eina...',
//       elevation: 4.0,
//       automaticallyImplyDrawerHamburger: false,
//       onQueryChanged: (query){
//         //Call your controller here
//       },
//         onSubmitted: (query){
// //A callback that gets invoked when the user submitted their query (e.g. hit the search button).
//         },
//       // Specify a custom transition to be used for
//       // animating between opened and closed stated:
//       transition: CircularFloatingSearchBarTransition(),
//
//         // the Widget returned by the builder is not allowed to have an unbounded (infinite) height.
//         // This is necessary in order for the search bar to be able to dismiss itself, when the user taps below the area :
//       // Therefore, shrinkWrap should be set to true on all Scrollables and physics to NeverScrollableScrollPhysics.
//         // On Columns, the mainAxisSize should be set to MainAxisSize.min.
//
//         builder: (BuildContext context, Animation<double> transition) {
//         return  ClipRRect(
//           borderRadius: BorderRadius.circular(8.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: Colors.accents.map((color){
//               return Container(height: 112, color:color);
//             }).toList(),
//           ),
//         );
//       }
//     );
//   }
// }
