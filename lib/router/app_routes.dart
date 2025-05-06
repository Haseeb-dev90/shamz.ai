import '/app_exports.dart';

class AppGenerateRoute {
  static Route<dynamic>? generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case RouteName.signIn:
        return _navigateScreen(const SignInScreen());
      case RouteName.signUp:
        return _navigateScreen(const SignUpScreen());
      case RouteName.forgetPassword:
        return _navigateScreen(const ForgetPasswordScreen());
      case RouteName.verifyEmail:
        return _navigateScreen(const VerifyEmailScreen());
      case RouteName.resetPassword:
        return _navigateScreen(const ResetPasswordScreen());
      case RouteName.homeScreen:
        return _navigateScreen(const HomeScreen());
      default:
        return _navigateScreen(const SplashScreen());
    }
  }

  static PageRouteBuilder _navigateScreen(Widget screen) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 450),
      pageBuilder: (_, __, ___) => screen,
      transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
        return customLeftSlideTransition(animation, child);
      },
    );
  }

  static Widget customLeftSlideTransition(Animation<double> animation, Widget child) {
    Tween<Offset> tween = Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0));
    return SlideTransition(
      position: tween.animate(animation),
      child: child,
    );
  }
}

class RouteName {
  static const splash = "/splash";
  static const signIn = "/signIn";
  static const signUp = "/signUp";
  static const forgetPassword = "/forgetPassword";
  static const verifyEmail = "/verifyEmail";
  static const resetPassword = "/resetPassword";
  static const addNewCard = "/addNewCard";
  static const homeScreen = "/homeScreen";
  static const dotRegulationScreen = "/dotRegulationScreen";

}
