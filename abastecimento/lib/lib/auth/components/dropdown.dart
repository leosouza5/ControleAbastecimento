import 'package:flutter/material.dart';

class DropDown extends StatelessWidget {
  final String? hint;
  final void Function(String?)? onChanged;
  final List<DropdownMenuItem<String>>? items;
  final TextStyle? hintStyle;
  final Text? label;
  final String? value;
  final bool senha;
  final bool enabled;
  final String? initialValue;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Color? borderColor;
  const DropDown({super.key, this.label, this.hint, this.hintStyle, this.borderColor, this.senha = false, this.controller, this.validator, this.enabled = true, this.initialValue, this.items, this.onChanged, this.value});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      validator: validator,
      value: value,
      items: items,
      decoration: InputDecoration(
        enabled: enabled,
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? Theme.of(context).colorScheme.onSurface),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? Theme.of(context).colorScheme.onSurface),
        ),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? Theme.of(context).colorScheme.onSurface),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? Theme.of(context).colorScheme.onSurface),
        ),
        hintText: hint,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        label: label,
        hintStyle: hintStyle ?? TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(.5)),
        labelStyle: TextStyle(fontSize: 20, color: borderColor),
      ),
      onChanged: onChanged,
    );
  }
}
