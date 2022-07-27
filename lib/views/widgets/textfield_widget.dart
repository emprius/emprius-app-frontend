
import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final String label;
  final String text;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

  const TextFieldWidget({
    Key? key,
    required this.label,
    required this.text,
    this.onChanged,
    this.controller
  }) : super(key: key);

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();

    controller = widget.controller ?? TextEditingController(text: widget.text);
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        widget.label,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      const SizedBox(height: 8),
      TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onChanged: widget.onChanged,
      ),
    ],
  );
}