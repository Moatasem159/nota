import 'package:flutter/material.dart';
import 'package:nota/core/extension/screen_size_extension.dart';
class CustomTextFormField extends StatelessWidget {
  final int ? maxLines;
  final int ?minLines;
  final TextStyle style;
  final String hintText;
  final TextStyle ?hintStyle;
  final bool autoFocus;
  final void Function(String)? onChange;
  const CustomTextFormField({
    super.key,
    this.maxLines,
    this.minLines,
    this.onChange,
    required this.style,
    required this.hintText, this.hintStyle,this.autoFocus=false,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus:autoFocus,
      maxLines: maxLines,
      minLines: minLines,
      keyboardType: TextInputType.multiline,
      style: style,
      onChanged: onChange,
      decoration: InputDecoration(
        isDense: true,
        isCollapsed: true,
        constraints: BoxConstraints(maxWidth: context.width - 35),
        hintText: hintText,
        hintStyle: hintStyle,
      ),
    );
  }
}