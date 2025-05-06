import '/app_exports.dart';

class ForgetPasswordButton extends StatelessWidget {
  final VoidCallback onTap;
  const ForgetPasswordButton({
    super.key, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: onTap,
        style: ButtonStyle(
          overlayColor: WidgetStateProperty.all(
            kGrey8EColor.withValues(alpha: 0.3),
          ),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(
                horizontal: 8
            ),
          ),
          visualDensity: const VisualDensity(
            horizontal: -2,
            vertical: -4,
          ),
        ),
        child: Text(
          "Forget Password?",
          style: AppStyles.w400f11poppins.copyWith(
            fontSize: 12,
            color: kPrimaryColor,
            decoration: TextDecoration.underline,
            decorationColor: kPrimaryColor,
            decorationThickness: 1.5,
            height: 1.5,
          ),
        ),
      ),
    );
  }
}