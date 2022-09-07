import 'package:empriusapp/src/core/common_widgets/custom_text_button.dart';
import 'package:empriusapp/src/features/search_map/application/providers/search_provider.dart';
import 'package:empriusapp/src/features/tool/domain/enums/tool_category_enum.dart';
import 'package:empriusapp/src/features/tool/domain/enums/tool_category_enum.dart';
import 'package:empriusapp/src/features/tool/domain/enums/tool_category_enum.dart';
import 'package:empriusapp/src/features/tool/domain/enums/tool_category_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../tool/domain/enums/tool_category_enum.dart';

class SelectedFilters{
  bool isAvailable = true;
  bool maybeFree = true;
  List<ToolCategory>? selectedCategories = [];
  int? maxCostCtrl;

  SelectedFilters();
  SelectedFilters.update(this.isAvailable, this.maybeFree, this.selectedCategories,
      this.maxCostCtrl);

//TODO Implement availableFrom

}

class SearchFilters extends ConsumerStatefulWidget {
  final void Function(SelectedFilters)? callback;

  const SearchFilters({
    Key? key,
    this.callback
  }) : super(key: key);

  @override
  createState() => _SearchFiltersState();
}

class _SearchFiltersState extends ConsumerState<SearchFilters> {
  late bool _isAvailable = true;
  late bool _maybeFree = true;
    var _currentCategory = ToolCategory.GARDENING;
   final _maxCostCtrl = TextEditingController();


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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Filtra per cost maxim:"),
                     //SizedBox(width: 10.0),
                  Expanded(
                    child: TextField(
                      controller: _maxCostCtrl,
                      keyboardType: TextInputType.number,
                    ),
                  )
                ]),
            // Wrap(
            //   spacing: 8,
            //   direction: Axis.horizontal,
            //   children: choiceChips(),
            // ),
            CustomTextButton(
                text: 'Aplica filtres',
                //onClicked: (){},
                //TODO: check this
                onClicked: () {
                  widget.callback?.call(
                      SelectedFilters.update(
                      _isAvailable,
                      _maybeFree,
                        //TODO select and pass diferent categories - FLUTTER CHIPS INPUT
                      [_currentCategory],
                        _maxCostCtrl.text.isNotEmpty ? int.parse(_maxCostCtrl.text): null,
                  ));
                  if (!mounted) return;
                  Navigator.of(context).pop();
                }
                )
      ]),
    );
  }
}


// Iterable<ToolCategory> choiceChips() {
//   return ToolCategory.values
//       .map((ToolCategory category) {
//     return Padding(
//       padding: const EdgeInsets.all(4.0),
//       child: FilterChip(
//
//       ),
//     )
//   })
// }

