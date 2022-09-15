import 'package:empriusapp/src/core/common_widgets/custom_text_button.dart';
import 'package:empriusapp/src/features/tool/domain/enums/tool_category_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrentFilters{
  bool isAvailable = true;
  bool maybeFree = true;
  int? maxCost;
  List<ToolCategory> selectedCategories = [];

  CurrentFilters();
  CurrentFilters.update(this.isAvailable, this.maybeFree, this.selectedCategories,
      this.maxCost);
//TODO Implement availableFrom

}

class SearchFilters extends ConsumerStatefulWidget {
  final void Function(CurrentFilters)? callback;
  final CurrentFilters currentFilters;

  const SearchFilters({
    Key? key,
    required this.currentFilters,
    this.callback
  }) : super(key: key);

  @override
  createState() => _SearchFiltersState();
}

class _SearchFiltersState extends ConsumerState<SearchFilters> {
  late bool _isAvailable = true;
  late bool _maybeFree = true;

  final _maxCostCtrl = TextEditingController();
  late List<ToolCategory> _selectedCategories = [];


  @override
  void initState() {
    _isAvailable = widget.currentFilters.isAvailable;
    _maybeFree = widget.currentFilters.maybeFree;
    _selectedCategories = widget.currentFilters.selectedCategories;
    if (widget.currentFilters.maxCost != null) {
      _maxCostCtrl.text = widget.currentFilters.maxCost.toString();
    }
    super.initState();
  }


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
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text("Buscar per categoria:"),
            //     SizedBox(width: 10.0),
            //     DropdownButton<ToolCategory>(
            //       value: _currentCategory,
            //       items: ToolCategory.values
            //           .map(
            //             (ToolCategory category) =>
            //             DropdownMenuItem<ToolCategory>(
            //               value: category,
            //               child: Text(category.displayName!),
            //             ),
            //       )
            //           .toList(),
            //       onChanged: (ToolCategory? value) {
            //         if (value != null && _currentCategory != value) {
            //           setState(() {
            //             _currentCategory = value;
            //           });
            //         }
            //       },
            //     ),
            //   ],
            // ),
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Filtra per cost maxim:"),
                  Expanded(
                    child: TextField(
                      controller: _maxCostCtrl,
                      keyboardType: TextInputType.number,
                    ),
                  )
                ]),
            Wrap(
              spacing: 8,
              direction: Axis.horizontal,
              children: choiceChips().toList(),
            ),
            CustomTextButton(
                text: 'Aplica filtres',
                onClicked: () {
                  widget.callback?.call(
                      CurrentFilters.update(
                        _isAvailable,
                        _maybeFree,
                        _selectedCategories,
                        _maxCostCtrl.text.isNotEmpty ? int.parse(
                            _maxCostCtrl.text) : null,
                      ));
                  if (!mounted) return;
                  Navigator.of(context).pop();
                }
            )
          ]),
    );
  }


  Iterable<FilterChip> choiceChips() {
    return ToolCategory.values
        .map((ToolCategory category) {
      return FilterChip(
          label: Text(category.displayName!),
          selected: _selectedCategories.contains(category),
          onSelected: (bool value) {
            setState(() {
              if (value) {
                _selectedCategories.add(category);
              } else {
                _selectedCategories.removeWhere(
                        (selectedCategory) => selectedCategory == category);
              }
            },
            );
          }
      );
    });
  }
}