import 'package:kepuharjo_framework/Rt_Rw/Drawer/select.dart';
import 'package:kepuharjo_framework/Rt_Rw/Screen/Surat_Masuk.dart';
import 'package:kepuharjo_framework/Rt_Rw/dashboard.dart';
import 'package:provider/provider.dart';

import '../custom_navigation_drawer.dart';
import 'package:flutter/material.dart';

class CollapsingNavigationDrawer extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemClicked;
  const CollapsingNavigationDrawer({
    Key? key,
    required this.selectedIndex,
    required this.onItemClicked,
  }) : super(key: key);
  @override
  CollapsingNavigationDrawerState createState() {
    return CollapsingNavigationDrawerState();
  }
}

class CollapsingNavigationDrawerState extends State<CollapsingNavigationDrawer>
    with SingleTickerProviderStateMixin {
  double maxWidth = 200;
  double minWidth = 80;
  bool isCollapsed = false;
  int currentSelectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void navigateTo(int index) {
    Provider.of<SelectedPage>(context, listen: false).selectedIndex = index;
    setState(() {
      currentSelectedIndex = index;
    });
    widget.onItemClicked(index);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return getWidget(context, widget);
  }

  Widget getWidget(context, widget) {
    return Material(
      elevation: 80.0,
      child: Container(
        width: 200,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.blue.shade900,
          Colors.blue.shade800,
          Colors.blue.shade600,
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 30),
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
                  return const Divider(height: 12.0);
                },
                itemBuilder: (context, counter) {
                  return CollapsingListTile(
                    onTap: () {
                      setState(() {
                        currentSelectedIndex = counter;
                      });
                      widget?.onItemClicked(counter);
                      navigateTo(counter);
                    },
                    isSelected: currentSelectedIndex == counter,
                    title: navigationItems[counter].title,
                    icon: navigationItems[counter].icon,
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
