import '/app_exports.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          context.showToast(
            state.error ?? "An error occurred",
            isError: true,
          );
        }
        if (state is LoginInProgress) {
          context.showLoading();
        } else {
          context.pop();
        }
        if (state is LoginSuccess) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen()
            ),
            (route) => false,
          );
          context.showToast(AppStrings.loginSuccess);
        }
      },
      child: Scaffold(
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
                    height: getProportionateScreenHeight(20),
                  ),
                  Text(
                    "Sign In",
                    style: AppTypography.bigBodyText,
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    "Please enter the credentials to login to\nyour account",
                    style: AppTypography.bigBodyText,
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(24),
                  ),
                  CustomTextField(
                    controller: _emailController,
                    hintText: "Enter email address",
                    validator: ValidateForm.validateEmail,
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(16),
                  ),
                  CustomTextField(
                    controller: _passwordController,
                    obscureText: true,
                    hintText: "Enter password",
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(8),
                  ),
                  ForgetPasswordButton(
                    onTap: () {
                      Navigator.pushNamed(context, RouteName.forgetPassword);
                    },
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(175),
                  ),
                  CustomActionButton(
                    buttonText: 'Log In',
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<LoginBloc>().add(LoginButtonPressed(
                              username: _emailController.text,
                              password: _passwordController.text,
                            ));
                      }
                    },
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(24),
                  ),
                  LinkToSignUpOrLogin(
                    text: "Don’t have account?",
                    linkText: "Sign Up",
                    onTap: () {
                      Navigator.pushReplacementNamed(context, RouteName.signUp);
                    },
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
