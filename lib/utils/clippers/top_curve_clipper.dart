import '../../app_exports.dart';

class TopCurveClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 80); // Curve start
    path.quadraticBezierTo(
      size.width / 2,
      -40, // Less deep bend than -80
      size.width,
      80, // End point same as start
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
