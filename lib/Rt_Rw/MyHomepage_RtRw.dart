import 'package:flutter/material.dart';
import 'package:kepuharjo_framework/Auth/Auth_services.dart';
import 'package:kepuharjo_framework/Rt_Rw/Drawer/select.dart';
import 'package:kepuharjo_framework/Rt_Rw/Screen/Surat_Masuk.dart';
import 'package:kepuharjo_framework/Rt_Rw/Screen/Surat_Selesai.dart';
import 'package:kepuharjo_framework/Rt_Rw/custom_navigation_drawer.dart';
import 'package:kepuharjo_framework/Rt_Rw/dashboard.dart';
import 'package:provider/provider.dart';

class HomePageRTRW extends StatefulWidget {
  const HomePageRTRW({super.key});

  @override
  State<HomePageRTRW> createState() => _HomePageRTRWState();
}

class _HomePageRTRWState extends State<HomePageRTRW> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  Widget getPage(int index) {
    switch (index) {
      case 0:
        return DashboarRtRw();
      case 1:
        return SuratMasuk();
      // add more cases for other screens
      default:
        return DashboarRtRw();
    }
  }

  final authServices = AuthServices();
  void selectedItem(BuildContext context, item) {
    switch (item) {
      case 0:
        // Navigator.of(context).push(
        //     MaterialPageRoute(builder: (context) => const InfoAplikasi()));
        break;

      case 1:
        authServices.logout(context);
        break;
    }
  }

  int selectedIndex = 0;
  void onItemClicked(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Widget buildBody() {
    switch (selectedIndex) {
      case 0:
        return DashboarRtRw();
      case 1:
        return SuratMasuk();
      // add more cases for other screens
      default:
        return Center(
          child: Text('No page found for index $selectedIndex'),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: white,
          shadowColor: Colors.transparent,
          title: Row(
            children: [
              Text(
                "S-Kepuharjo",
                style: MyFont.montserrat(
                    fontSize: 18, color: black, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          leading: InkWell(
            onTap: () {
              _openDrawer();
            },
            child: Icon(
              Icons.menu_rounded,
              color: black,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Theme(
                data: Theme.of(context).copyWith(
                    textTheme: TextTheme().apply(bodyColor: Colors.white),
                    dividerColor: Colors.white,
                    iconTheme: IconThemeData(color: Colors.white)),
                child: PopupMenuButton<int>(
                  color: Colors.white,
                  itemBuilder: (context) => [
                    PopupMenuItem<int>(
                        value: 0,
                        child: Row(
                          children: [
                            Icon(
                              Icons.info,
                              color: blue,
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            Text(
                              "Info Aplikasi",
                              style: MyFont.poppins(fontSize: 12, color: black),
                            )
                          ],
                        )),
                    PopupMenuItem<int>(
                        value: 1,
                        child: Row(
                          children: [
                            Icon(
                              Icons.help,
                              color: blue,
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            Text(
                              "Log Out",
                              style: MyFont.poppins(fontSize: 12, color: black),
                            )
                          ],
                        )),
                  ],
                  onSelected: (item) => selectedItem(context, item),
                ),
              ),
            ),
          ],
        ),
        drawer: CollapsingNavigationDrawer(
          selectedIndex: selectedIndex,
          onItemClicked: onItemClicked,
        ),
        body: Consumer<SelectedPage>(
          builder: (context, selectedPage, child) {
            return getPage(selectedPage.selectedIndex);
          },
        ));
  }
}
