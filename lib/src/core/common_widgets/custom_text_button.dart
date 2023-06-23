import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  final Color? color;
  final EdgeInsetsGeometry padding;
  final double borderRadius;

  /// If listener is defined wraps the button on a consumer
  ///
  /// Util to use the maybeWhen when the button interacts with a FutureState
  /// provider
  final Widget Function(BuildContext context, WidgetRef ref, Widget? child)?
      builder;

  const CustomTextButton({
    Key? key,
    required this.text,
    required this.onClicked,
    this.builder,
    this.color,
    this.borderRadius = 8,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
  }) : super(key: key);

  Widget _buildButton() => ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(padding),
          shape: MaterialStateProperty.all(const StadiumBorder()),
        ),
        onPressed: onClicked,
        child: Text(text),
      );

  @override
  Widget build(BuildContext context) {
    if (builder != null) {
      return Consumer(
        builder: builder!,
        child: _buildButton(),
      );
    }
    return _buildButton();
  }
}
