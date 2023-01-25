import 'package:empriusapp/src/features/search_map/presentation/widgets/search_filters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class CustomSearchBar extends StatefulWidget {
  final Future<void> Function(String, CurrentFilters)? searchCallback;

 CustomSearchBar({
   Key? key,
   this.searchCallback
 }) : super(key: key);

  @override
  createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final _searchTermCtrl = TextEditingController();
  var _currentFilters = CurrentFilters();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: TextField(
            controller: _searchTermCtrl,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              prefixIcon: IconButton(
                onPressed: (){
                  showModalBottomSheet(
                      context: context,
                      builder: ((builder) =>
                          SearchFilters(
                            currentFilters: _currentFilters,
                            callback: (CurrentFilters selectedFilters){
                              _currentFilters = selectedFilters;
                            },)));
                }, icon: const Icon(Icons.tune),
              ),
              suffixIcon: !_isLoading
                  ? IconButton(
                  onPressed: () async{
                    setState((){
                      _isLoading = true;
                        });
                        await widget.searchCallback?.call(_searchTermCtrl.text, _currentFilters);
                        setState((){
                          _isLoading = false;
                        });
                      },
                      icon: const Icon(Icons.search))
                    : SpinKitCircle(
                color: Theme.of(context).primaryColor,
                  size: 20.0,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
                hintText: "Cerca eines",
            ),
          ),
        ),
      ],
    );
  }
}
