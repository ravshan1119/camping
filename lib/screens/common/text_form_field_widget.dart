import 'package:camping/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    super.key,
    this.controller,
    this.focusNode,
    this.hintText,
    this.hintStyle,
    required this.radius,
    this.obscureText,
    this.maxLines,
    this.validator,
    this.inputFormatter,
    this.suffixIcon,
    this.onChanged,
    this.onSubmit,
    this.onTap,
    this.textInputType,
    this.textInputAction,
    this.prefixText,
    this.style,
    this.prefixIcon,
    this.prefixConstraints,
    this.editable,
    this.autoFocus,
    this.fillColor,
    this.contentPadding,
    this.textAlign,
    this.error, this.suffixConstraints,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText;
  final TextStyle? hintStyle;
  final double radius;
  final bool? obscureText;
  final int? maxLines;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatter;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final Function(String)? onSubmit;
  final Function()? onTap;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final String? prefixText;
  final TextStyle? style;
  final Widget? prefixIcon;
  final BoxConstraints? prefixConstraints;
  final bool? editable;
  final Color? fillColor;
  final EdgeInsets? contentPadding;
  final TextAlign? textAlign;
  final bool? autoFocus;
  final String? error;
  final BoxConstraints? suffixConstraints;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      onFieldSubmitted: onSubmit,
      keyboardType: textInputType,
      inputFormatters: inputFormatter,
      validator: validator,
      maxLines: maxLines ?? 1,
      obscureText: obscureText ?? false,
      onTap: onTap,
      onChanged: onChanged,
      style: style,
      autofocus: autoFocus ?? false,
      textInputAction: textInputAction,
      textAlign: textAlign ?? TextAlign.start,
      decoration: InputDecoration(
        suffixIconConstraints: suffixConstraints,
        enabled: editable ?? true,
        fillColor: fillColor,
        filled: fillColor != null ? true : false,
        errorText: error,
        contentPadding: contentPadding,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: const BorderSide(
            color: primaryColor,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: const BorderSide(color: AppColors.grey_400, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: const BorderSide(color: AppColors.warning, width: 1.5),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            radius,
          ),
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        prefixIconConstraints: prefixConstraints,
        hintText: hintText,
        hintStyle: hintStyle,
        prefixText: prefixText,
        prefixStyle: const TextStyle(
          color: AppColors.black,
          fontSize: 16,
        ),
      ),
    );
  }
}
