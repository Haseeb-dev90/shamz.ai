import 'dart:ui';
import '../utils/clippers/top_curve_clipper.dart';
import '/app_exports.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final curveHeight = screenHeight * 0.53;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              Assets.pngWelcomeImage,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: screenHeight * 0.46,
            left: 0,
            right: 0,
            child: ClipPath(
              clipper: TopCurveClipper1(),
              child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
                  child: Container(
                    height: screenHeight / 2,
                    decoration: BoxDecoration(
                      color: kWhiteColor.withValues(alpha: 0.1),
                    ),
                  )),
            ),
          ),
          Positioned(
            top: curveHeight,
            left: 0,
            right: 0,
            child: ClipPath(
              clipper: TopCurveClipper1(),
              child: Container(
                height: screenHeight / 2,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [kPrimaryColor, kYellowColor],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                ),
                child: Center(child: _buildBottomContainer()),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomContainer() {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(24)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Lorem ipsum\n',
                  style: AppTypography.h1.copyWith(
                    fontSize: 27,
                    fontWeight: FontWeight.w400,
                    color: kPrimaryColor,

                  ),
                ),
                TextSpan(
                  text: 'dolor sit amet\nconsectetur !',
                  style: AppTypography.h1.copyWith(
                    fontSize: 27,
                    fontWeight: FontWeight.w400,

                  ),
                ),
              ],
            ),
          )
,
          SizedBox(
            height: getProportionateScreenHeight(45),
          ),
          CustomActionButton(
              buttonText: 'Log in',
              buttonTextStyle:
                  AppTypography.buttonText.copyWith(color: kWhiteColor, fontSize: getProportionateScreenHeight(24)),
              height: getProportionateScreenHeight(75),
              backgroundColor: kBlackColor,
              borderRadius: 100,
              onTap: () {
                Navigator.pushNamed(context, RouteName.signIn);
              }),
          SizedBox(
            height: getProportionateScreenHeight(12),
          ),
          CustomActionButton(
              buttonText: 'Create an account',
              buttonTextStyle:
              AppTypography.buttonText.copyWith(fontSize: getProportionateScreenHeight(24)),
              height: getProportionateScreenHeight(75),
              backgroundColor: kBlackColor.withValues(alpha: 0.2),
              borderRadius: 100,
              onTap: () {
                Navigator.pushNamed(context, RouteName.signUp);
              }),
        ],
      ),
    );
  }
}
