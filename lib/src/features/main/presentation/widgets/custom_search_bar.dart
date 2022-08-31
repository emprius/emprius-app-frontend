import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class CustomSearchbar extends StatefulWidget {
  const CustomSearchbar({Key? key}) : super(key: key);

  @override
  State<CustomSearchbar> createState() => _CustomSearchbarState();
}

class _CustomSearchbarState extends State<CustomSearchbar> {
  @override
  Widget build(BuildContext context) {
    return FloatingSearchBar(
      hint: 'Busca eina...',
      elevation: 4.0,
      onQueryChanged: (query){
        //Your methods will be here
      },
      builder: (
          BuildContext context,
          Animation<double> transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Material(
            color: Colors.white,
            child: Container(
              height: 200.0,
              color: Colors.white,
              // child: Column(
              //   children: [
              //     ListTile(
              //       title: Text('Home'),
              //       subtitle: Text('more info here........'),
              //     ),
              //   ],
              ),
            ),
          );
      },

    );
  }
}
