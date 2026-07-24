import 'package:aurabajar/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AuraTextField extends StatefulWidget {
  const AuraTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.prefixIcon,
    this.suffixIcon,
    this.label,
    this.hint,
    this.isPassword = false,
    this.enabled = true,
    this.readOnly = false,
    this.maxLines = 1,
    this.minLines,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;

  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;

  final String? label;
  final String? hint;

  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final bool isPassword;
  final bool enabled;
  final bool readOnly;

  final int maxLines;
  final int? minLines;

  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;

  @override
  State<AuraTextField> createState() => _AuraTextFieldState();
}

class _AuraTextFieldState extends State<AuraTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder border(Color color) {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: color, width: 1.2),
      );
    }

    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      validator: widget.validator,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onFieldSubmitted,
      obscureText: _obscureText,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      maxLines: widget.isPassword ? 1 : widget.maxLines,
      minLines: widget.minLines,
      cursorColor: AppColors.primary,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hint,

        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : widget.suffixIcon,
        filled: true,
        fillColor: AppColors.white,

        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),

        border: border(AppColors.grey),
        enabledBorder: border(AppColors.grey),
        focusedBorder: border(AppColors.primary),
        errorBorder: border(AppColors.error),
        focusedErrorBorder: border(AppColors.error),
        disabledBorder: border(AppColors.lightGrey),

        errorMaxLines: 2,
      ),
    );
  }
}
