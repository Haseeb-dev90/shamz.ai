import '/app_exports.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;

  @override
  void initState() {
    _emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(60),
                ),
                //todo icons need to be updated
                // Image.asset(
                //   Assets.pngAssetsSplash,
                //   height: getProportionateScreenHeight(100),
                //   width: getProportionateScreenWidth(150),
                // ),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                Text(
                  "Forget Password",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: kBlackColor.withValues(alpha: 0.7)),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                Text(
                  "Let’s help you get back in. Enter the email\nlinked to your account",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: AppTypography.secondaryTextSize,
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(24),
                ),
                CustomTextField(
                  controller: _emailController,
                  hintText: 'Email',
                  validator: ValidateForm.validateEmail,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(300),
                ),
                CustomActionButton(
                  buttonText: 'Continue',
                  onTap: _sendEmailVerificationLink,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _sendEmailVerificationLink() async {
    if (_formKey.currentState!.validate()) {
      try {
        context.showLoading();
        // Handle password reset email logic
        context.showToast("Password reset link has been sent to your email");
        context.pop();
      } catch (e) {
        context.showToast(e.toString(), isError: true);
      } finally {
        context.pop();
      }
    }
  }
}
