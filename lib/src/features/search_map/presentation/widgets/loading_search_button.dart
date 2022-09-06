import 'package:empriusapp/src/features/search_map/application/providers/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoadingTextButton extends ConsumerWidget {
  final String text;
  final VoidCallback onClicked;
  final Color? color;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final VoidCallback? isLoading;

  const LoadingTextButton({
    Key? key,
    required this.text,
    required this.onClicked,
    this.isLoading,
    this.color,
    this.borderRadius = 6,
    this.padding  = const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    ThemeData currentTheme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: padding,
          primary: color ?? currentTheme.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        onPressed: ()=> ref.read(searchProvider.notifier).searchTools(),
        child: Text(text),
      ),
    );
  }
}

