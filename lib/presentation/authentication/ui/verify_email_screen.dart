import 'dart:developer';
import '/app_exports.dart';


class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginInProgress) {
          context.showLoading(
            color: kPrimaryColor,
          );
        } else {
          context.pop();
        }
        if (state is LoginVerification) {
          context.showToast(
            state.error ?? "An error occurred",
            isError: true,
          );
        }
        if (state is LoginSuccess) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const CustomBottomNavBar(index: 0),
            ),
            (route) => false,
          );
          context.showToast(AppStrings.loginSuccess);
        }
        if (state is LoginFailure) {
          context.showToast("Something went wrong", isError: true);
        }
        log("Current state is $state");
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(60),
                ),
                Image.asset(
                  Assets.pngAssetsSplash,
                  height: getProportionateScreenHeight(100),
                  width: getProportionateScreenWidth(150),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                Text(
                  "Verify Email",
                  style: AppStyles.w600f24inter.copyWith(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: kBlackColor.withValues(alpha: 0.7)
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                Text(
                  "We’ve sent a verification link to your email.\nPlease check and verify",
                  textAlign: TextAlign.center,
                  style: AppStyles.w400f16inter.copyWith(
                    fontSize: 14,
                    color: kGray61Color,
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(320),
                ),
                CustomActionButton(
                  buttonText: "Verify Email",
                  onTap: () {
                    context.read<LoginBloc>().add(VerifyEmailButtonPressed());
                  },
                ),
                const Spacer(),
                LinkToSignUpOrLogin(
                  text: 'Haven’t received any mail?',
                  linkText: "Resend Email",
                  onTap: () async {
                    try {
                      context.showLoading();
                     //Handle email verification logic
                      context.pop();
                      context.showToast("Email sent successfully");
                    } catch (e) {
                      context.showToast(e.toString(), isError: true);
                    }
                  },
                ),
                SizedBox(
                  height: getProportionateScreenHeight(8),
                ),
                LinkToSignUpOrLogin(
                  text: 'Already have an account?',
                  linkText: "Login",
                  onTap: () async {
                    try {
                     // Handle sign out logic
                      Navigator.pushReplacementNamed(context, RouteName.signIn);
                    } catch (e) {
                      context.showToast(e.toString(), isError: true);
                    }
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
    );
  }
}
