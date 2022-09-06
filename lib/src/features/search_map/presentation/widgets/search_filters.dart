import 'dart:ffi';

import 'package:empriusapp/src/core/common_widgets/custom_text_button.dart';
import 'package:empriusapp/src/features/search_map/application/providers/search_provider.dart';
import 'package:empriusapp/src/features/tool/domain/enums/tool_category_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchFilters extends ConsumerStatefulWidget {
  const SearchFilters({Key? key}) : super(key: key);

  @override
  createState() => _SearchFiltersState();
}

class _SearchFiltersState extends ConsumerState<SearchFilters> {
  late bool _isAvailable = true;
  late bool _maybeFree = true;
  var _currentCategory = ToolCategory.GARDENING;

  //TODO Implement searchTerm, center, maxCost and availableFrom


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
      physics: const BouncingScrollPhysics(),
      child: Column(
          children: [
            CheckboxListTile(
                title: Text("Disponibles actualment"),
                value: _isAvailable,
                onChanged: (value) {
                  setState(() {
                    _isAvailable = value as bool;
                  });
                }),
            CheckboxListTile(
                title: Text("Disponibles sense cost"),
                value: _maybeFree,
                onChanged: (value) {
                  setState(() {
                    _maybeFree = value as bool;
                  });
                }),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Buscar per categoria:"),
                SizedBox(width: 10.0),
                DropdownButton<ToolCategory>(
                  value: _currentCategory,
                  items: ToolCategory.values
                      .map(
                        (ToolCategory category) => DropdownMenuItem<ToolCategory>(
                      value: category,
                      child: Text(category.displayName!),
                    ),
                  )
                      .toList(),
                  onChanged: (ToolCategory? value) {
                    if (value != null && _currentCategory != value) {
                      setState(() {
                        _currentCategory = value;
                      });
                    }
                  },
                ),
              ],
            ),
            CustomTextButton(
                text: 'Aplica filtres',
                //onClicked: (){},
    //TODO: check this
                onClicked: () async{

                  await ref.watch(searchProvider.notifier)
                      .searchTools(
                    //TODO create textfield controller:
                    //maxCost: _maxCost,
                    maybeFree: _maybeFree,
                    //TODO select and pass diferent categories - FLUTTER CHIPS INPUT
                    //categories: _currentCategory,
                  );}
                )
      ]),
    );
  }
}
