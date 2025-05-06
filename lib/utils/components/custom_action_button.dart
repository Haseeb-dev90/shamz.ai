import 'package:shamz_ai/app_exports.dart';

class CustomActionButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onTap;
  final double? width;
  final bool isEnabled;
  final Color? backgroundColor;
  final Color buttonTextColor;
  final TextStyle? buttonTextStyle;
  final Color? borderColor;
  final EdgeInsets margin;
  final double? height;
  final double borderRadius;

  const CustomActionButton({
    super.key,
    required this.buttonText,
    required this.onTap,
    this.width,
    this.isEnabled = true,
    this.backgroundColor = kBlackColor,
    this.buttonTextColor = kWhiteColor,
    this.buttonTextStyle,
    this.borderColor,
    this.margin = EdgeInsets.zero,
    this.height = 52,
    this.borderRadius = 8,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isEnabled ? onTap : null,
      child: Container(
        width: width,
        margin: margin,
        height: height,
        // padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(15)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: isEnabled
              ? backgroundColor
              : backgroundColor?.withValues(alpha: 0.5),
          border: borderColor != null ? Border.all(color: borderColor!) : null,
        ),
        child: Center(
          child: Text(
            buttonText,
            style: buttonTextStyle ??
                AppTypography.buttonText.copyWith(color: kWhiteColor),
          ),
        ),
      ),
    );
  }
}
