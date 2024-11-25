import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatefulWidget {
  final String? hint;
  final TextStyle? hintStyle;

  final Text? label;
  final bool senha;
  final bool enabled;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;
  final void Function()? onTap;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Color? borderColor;
  const Input({super.key, this.label, this.hint, this.hintStyle, this.borderColor, this.senha = false, this.controller, this.validator, this.enabled = true, this.initialValue, this.inputFormatters, this.keyboardType, this.onTap});

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: widget.onTap,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      initialValue: widget.initialValue,
      validator: widget.validator,
      controller: widget.controller,
      obscureText: widget.senha && obscure,
      cursorColor: widget.borderColor,
      style: TextStyle(fontSize: 20, color: Color(0xFFE0E0E0)),
      decoration: InputDecoration(
        enabled: widget.enabled,
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor ?? Color(0xFF2C2C2C)),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor ?? Color(0xFF2C2C2C)),
        ),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor ?? Color(0xFF2C2C2C)),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor ?? Color(0xFF2C2C2C)),
        ),
        hintText: widget.hint,
        suffixIcon: widget.senha
            ? IconButton(
                onPressed: () {
                  setState(() {
                    obscure = !obscure;
                  });
                },
                icon: Icon(
                  obscure ? Icons.visibility : Icons.visibility_off,
                  color: Color(0xFFE0E0E0),
                ))
            : null,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        label: widget.label,
        hintStyle: widget.hintStyle ?? TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(.5)),
        labelStyle: TextStyle(fontSize: 20, color: Color(0xFFE0E0E0)),
      ),
    );
  }
}
