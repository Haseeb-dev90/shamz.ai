import '/app_exports.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showBackIcon;
  const CustomAppBar({
    super.key, this.showBackIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Custom AppBar'),
      leading: showBackIcon ? IconButton(
        icon: Icon(Icons.arrow_back),
        style: IconButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ) : null,
      toolbarHeight: getProportionateScreenHeight(173),
      centerTitle: true,
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(getProportionateScreenHeight(80));
}
