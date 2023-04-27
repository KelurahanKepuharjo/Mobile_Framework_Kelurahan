import '../custom_navigation_drawer.dart';
import 'package:flutter/material.dart';

class CollapsingNavigationDrawer extends StatefulWidget {
  @override
  CollapsingNavigationDrawerState createState() {
    return new CollapsingNavigationDrawerState();
  }
}

class CollapsingNavigationDrawerState extends State<CollapsingNavigationDrawer>
    with SingleTickerProviderStateMixin {
  double maxWidth = 200;
  double minWidth = 80;
  bool isCollapsed = false;
  late AnimationController _animationController;
  late Animation<double> widthAnimation;
  int currentSelectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    widthAnimation = Tween<double>(begin: maxWidth, end: minWidth)
        .animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, widget) => getWidget(context, widget),
    );
  }

  Widget getWidget(context, widget) {
    return Material(
      elevation: 80.0,
      child: Container(
        width: widthAnimation.value,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.blue.shade900,
          Colors.blue.shade800,
          Colors.blue.shade600,
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Column(
          children: <Widget>[
            // CollapsingListTile(
            //   title: 'Techie',
            //   icon: Icons.person,
            //   animationController: _animationController,
            //   onTap: () {},
            // ),
            // Divider(
            //   color: Colors.grey,
            //   height: 40.0,
            // ),
            Padding(
              padding: EdgeInsets.only(top: 50, bottom: 30),
              child: ListTile(
                  leading: Image.asset(
                    "images/mylogo.png",
                    height: 40,
                  ),
                  title: Text(
                    "S-Kepuharjo",
                    style: MyFont.poppins(
                        fontSize: 18,
                        color: white,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, counter) {
                  return Divider(height: 12.0);
                },
                itemBuilder: (context, counter) {
                  return CollapsingListTile(
                    onTap: () {
                      setState(() {
                        currentSelectedIndex = counter;
                      });
                    },
                    isSelected: currentSelectedIndex == counter,
                    title: navigationItems[counter].title,
                    icon: navigationItems[counter].icon,
                    animationController: _animationController,
                  );
                },
                itemCount: navigationItems.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
