import '/app_exports.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBackIcon: false,
      ),
      body: Center(
        child: Text("Setting Screen"),
      ),
    );
  }
}
