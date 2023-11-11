import 'package:coincontrol/imports.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => Custom_DrawerState();
}

class Custom_DrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    final appBloc = Provider.of<ApplicationBloc>(context);
    return Drawer(
      child: Container(
        padding: const EdgeInsets.all(20),
        color: isDarkTheme(context) == true ? Colors.black38 : LIGHT_PRI_COLOR,
        child: Column(
          children: [
            const Spacer(),
            ListTile(
              leading: const Icon(
                Icons.settings,
              ),
              title: const Text('Settings'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainSettings(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.logout_rounded,
              ),
              title: const Text('Logout'),
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Login(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
