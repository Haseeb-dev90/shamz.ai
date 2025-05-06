import 'dart:developer';
import '/app_exports.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final Color? fillColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? borderColor;
  final Color? prefixIconColor;
  final double? textHorizontalPadding;
  final int? maxLines, maxLength;
  final String? Function(String?)? validator;
  final bool? autoFocus, readOnly;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final void Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  final TextInputType keyboardType;
  final FocusNode? focusNode;
  final double alphaColor;
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.fillColor,
    this.borderColor,
    this.prefixIcon,
    this.prefixIconColor,
    this.suffixIcon,
    this.maxLines,
    this.validator,
    this.autoFocus,
    this.readOnly,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.maxLength,
    this.inputFormatters,
    this.textHorizontalPadding = 18,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.focusNode,
    this.alphaColor = 0.8,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool hidePassword = true;

  get key => widget.key;

  get validator => widget.validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: widget.maxLength,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onTap: widget.onTap,
      focusNode: widget.focusNode,
      onChanged: (value) {
        widget.onChanged?.call(value);
      },
      onTapOutside: (_) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onFieldSubmitted: widget.onSubmitted,
      inputFormatters: widget.inputFormatters,
      maxLines: widget.maxLines ?? 1,
      autofocus: widget.autoFocus ?? false,
      readOnly: widget.readOnly ?? false,
      obscureText: widget.obscureText && hidePassword,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      style: AppTypography.bodyText,
      cursorColor: kBlackColor,
      decoration: InputDecoration(
        counter: const SizedBox.shrink(),
        border: InputBorder.none,
        suffixIcon: widget.suffixIcon ??
            (widget.obscureText
                ? InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                      log('Hide Password: ${hidePassword && widget.obscureText}');
                    },
                    //todo icons need to be updated
                    child: Padding(
                        padding: EdgeInsets.only(
                            right: getProportionateScreenWidth(24)),
                        child: hidePassword && widget.obscureText
                            ? Image.asset(Assets.pngAppIcon)
                            : Image.asset(Assets.pngAppIcon)),
                  )
                : null),
        contentPadding: EdgeInsets.symmetric(
            horizontal: widget.textHorizontalPadding!, vertical: 14),
        prefixIconColor: widget.prefixIconColor,
        errorStyle: AppTypography.bodyText,
        hintText: widget.hintText,
        hintStyle: AppTypography.bodyText,
        filled: true,
        fillColor: kBlackColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: widget.borderColor ?? kBlackColor,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: widget.borderColor ?? kBlackColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
