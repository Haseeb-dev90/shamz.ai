import '/app_exports.dart';

class ForgetPasswordButton extends StatelessWidget {
  final VoidCallback onTap;
  const ForgetPasswordButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: onTap,
        style: ButtonStyle(
          overlayColor: WidgetStateProperty.all(
            kPrimaryColor.withValues(alpha: 0.3),
          ),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 8),
          ),
          visualDensity: const VisualDensity(
            horizontal: -2,
            vertical: -4,
          ),
        ),
        child: Text(
          "Forget Password?",
          style: AppTypography.bodyText,
        ),
      ),
    );
  }
}
