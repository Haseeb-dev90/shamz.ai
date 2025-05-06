import '/app_exports.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(60),
                ),
                SvgPicture.asset(
                  Assets.svgAssetsFeederIcon,
                  height: getProportionateScreenHeight(100),
                  width: getProportionateScreenWidth(100),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                Text(
                  "Reset Password",
                  style: AppStyles.w600f24inter.copyWith(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                Text(
                  "Create a new strong password to reset your\naccount access.",
                  textAlign: TextAlign.center,
                  style: AppStyles.w400f16inter.copyWith(
                    fontSize: 14,
                    color: kGray61Color,
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(24),
                ),
                CustomTextField(
                  hintText: "Enter New password",
                  obscureText: true, controller: _passwordController,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(16),
                ),
                CustomTextField(
                  hintText: "Confirm your password",
                  obscureText: true, controller: _confirmPasswordController,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(40),
                ),
                CustomActionButton(
                  buttonText: "Reset Password",
                  onTap: () {
                    Navigator.pushNamed(context, RouteName.signIn);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
