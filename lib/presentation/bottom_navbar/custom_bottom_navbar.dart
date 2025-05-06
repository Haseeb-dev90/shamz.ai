import '/app_exports.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int index;

  const CustomBottomNavBar({super.key, this.index = 0});

  @override
  CustomBottomNavBarState createState() => CustomBottomNavBarState();
}

class CustomBottomNavBarState extends State<CustomBottomNavBar> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.index;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: _getSelectedWidget(_selectedIndex),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: kWhiteColor.withValues(alpha: 0.75),
            border: const Border(
              top: BorderSide(
                color: Color(0x30000000),
                width: 0.33,
              ),
            ),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            elevation: 0,
            items: [
              _buildBottomNavigationBarItem(
                activeIcon: Assets.svgAssetsActiveHomeIcon,
                inactiveIcon: Assets.svgAssetsHomeIcon,
                label: 'Home',
                index: 0,
              ),
              _buildBottomNavigationBarItem(
                activeIcon: Assets.svgAssetsTrackActiveIcon,
                inactiveIcon: Assets.svgAssetsTrackInactiveIcon,
                label: 'Track',
                index: 1,
              ),
              _buildBottomNavigationBarItem(
                activeIcon: Assets.svgAssetsActiveSettingsIcon,
                inactiveIcon: Assets.svgAssetsSettingsIcon,
                label: 'Settings',
                index: 2,
              ),
            ],
            currentIndex: _selectedIndex,
            selectedLabelStyle: AppStyles.w400f11poppins.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 10,
              color: kPrimaryColor,
            ),
            unselectedLabelStyle: AppStyles.w400f11poppins.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 10,
              color: const Color(0XFF999999),
            ),
            selectedItemColor: kPrimaryColor,
            unselectedItemColor: const Color(0XFF999999),
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem({
    required String activeIcon,
    required String inactiveIcon,
    required String label,
    required int index,
  }) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        _selectedIndex == index ? activeIcon : inactiveIcon,
      ),
      label: label,
    );
  }

  Widget _getSelectedWidget(int index) {
    switch (index) {
      case 0:
        return const HomeScreen();
      case 1:
        return  const ProfileScreen();
      case 2:
        return const SettingScreen();
      default:
        return const HomeScreen();
    }
  }
}
