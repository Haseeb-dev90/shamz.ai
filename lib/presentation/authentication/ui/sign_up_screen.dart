import '/app_exports.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _nameController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController = TextEditingController();
    _nameController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginInProgress) {
          context.showLoading();
        } else {
          context.pop();
        }
        if (state is LoginFailure) {
          context.showToast(
            state.error ?? "An error occurred",
            isError: true,
          );
        }
        if (state is LoginSuccess) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => HomeScreen()
            ),
                (route) => false,
          );}
        if (state is LoginVerification) {
          Navigator.pushReplacementNamed(
            context,
            RouteName.verifyEmail,
          );
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
                    "Sign Up",
                    style: AppTypography.bigBodyText,
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    "Please enter the following details to\ncreate an account",
                    style: AppTypography.bigBodyText,
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(24),
                  ),
                  CustomTextField(
                    controller: _nameController,
                    hintText: "Enter your name",
                    validator: ValidateForm.fullNameValidator,
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(16),
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
                    validator: (p0) => ValidateForm.passwordValidator(p0),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(16),
                  ),
                  CustomTextField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    hintText: "Confirm password",
                    validator: (p0) => ValidateForm.confirmPasswordValidator(
                        p0, _passwordController.text),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(75),
                  ),
                  CustomActionButton(
                    buttonText: 'Create Account',
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<LoginBloc>().add(
                              SignUpButtonPressed(
                                user: UserModel(
                                  email: _emailController.text,
                                  name: _nameController.text,
                                  password: _passwordController.text,
                                ),
                              ),
                            );
                      }
                    },
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(24),
                  ),
                  LinkToSignUpOrLogin(
                    text: "Don’t have account?",
                    linkText: "Sign In",
                    onTap: () {
                      Navigator.pushReplacementNamed(context, RouteName.signIn);
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
