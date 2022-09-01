import 'package:empriusapp/src/features/tool/domain/enums/tool_category_enum.dart';
import 'package:flutter/material.dart';

class SearchFilters extends StatefulWidget {
  const SearchFilters({Key? key}) : super(key: key);

  @override
  State<SearchFilters> createState() => _SearchFiltersState();
}

class _SearchFiltersState extends State<SearchFilters> {
  late bool _isAvailable = true;
  late bool _maybeFree = true;
  var _currentCategory = ToolCategory.GARDENING;


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
      ]),
    );
  }
}
