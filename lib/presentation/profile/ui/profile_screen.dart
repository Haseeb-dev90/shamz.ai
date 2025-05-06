import '/app_exports.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBackIcon: false,
      ),
      body: Center(
        child: Text("Track Screen"),
      ),
    );
  }
}
