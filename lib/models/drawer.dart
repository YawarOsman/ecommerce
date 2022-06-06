import 'package:ecommerce/models/richtext.dart';
import 'package:ecommerce/provider.dart';
import 'package:ecommerce/screens/signin.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatefulWidget {
  MediaQueryData mediaQueryData;
  DrawerWidget({Key? key, required this.mediaQueryData}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  List categoriesList = [
    "Electronics",
    "Clothes",
    "Mechanique",
    "Sports",
    "Furniture",
    "Toys & Games",
    "Arts & Crafts",
    "Office supplies",
    "Books",
    "Beauty & Personal Care",
    "Garden & Outdoor",
    "Medicine",
    "Cleaning supplies",
  ];
  List ElectronicsSubCategoreisList = [
    "Laptop",
    "Tablet",
    "Earphones",
    "Smart Watch",
    "Laptop Accessories",
    "Gaming Accessories",
    "Monitor",
    "Headphones",
    "Desktop Parts",
    "Apple Accessories",
    "Charger"
  ];
  bool displayCategoriesContainer = false;
  bool showElectronics = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<ClassProvider>(
      builder: (context, providerValue, child) => Drawer(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 50, bottom: 10),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 38,
                  backgroundImage: providerValue.getIsLoggedIn
                      ? AssetImage('assets/images/profile.jpeg')
                      : AssetImage('assets/images/notLoggedInProfile.png'),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: providerValue.getIsLoggedIn
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Test Test',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text('testtest@gmail.com')
                            ],
                          )
                        : Container(
                            width: 180,
                            child: RichText(
                              text: TextSpan(
                                  text:
                                      'You are currently not logged in, please ',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .color),
                                  children: [
                                    MouseRegionSpan(
                                        // this is a class (MouseRegionSpan) that we created manually to wrap TextSpan with MouseRegion because you can't wrap TextSpan with MouseRegion directly inside children of another TextSpan

                                        mouseCursor: SystemMouseCursors.click,
                                        inlineSpan: TextSpan(
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                Navigator.pop(context);
                                                Navigator.pushNamed(
                                                    context, '/signin');
                                              },
                                            text: 'Log In',
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.bold)))
                                  ]),
                            )))
              ],
            ),
          ),
          Divider(
            height: 1,
            color: Theme.of(context).iconTheme.color,
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Column(
                  children: [
                    DrawerButtons(
                        title: 'Home',
                        icon: Icons.home,
                        callBack: () {
                          Navigator.popUntil(context, ModalRoute.withName('/'));
                        }),
                    DrawerButtons(
                      title: 'Categories',
                      icon: Icons.category,
                      callBack: () {
                        showElectronics = false;
                        displayCategoriesContainer =
                            !displayCategoriesContainer;
                        setState(() {});
                      },
                      optionalColor: displayCategoriesContainer
                          ? providerValue.getIsDark
                              ? Colors.white10
                              : Colors.grey.shade300
                          : Colors.transparent,
                    ),
                    AnimatedContainer(
                        color: Colors.transparent,
                        height: displayCategoriesContainer ? null : 0,
                        duration: Duration(seconds: 3),
                        child: ListView.builder(
                            itemCount: categoriesList.length,
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => Column(
                                  children: [
                                    DrawerButtons(
                                      title: categoriesList[index],
                                      icon: null,
                                      callBack: () {
                                        if (index == 0) {
                                          showElectronics = !showElectronics;
                                          setState(() {});
                                        }
                                      },
                                      optionalColor:
                                          showElectronics && index == 0
                                              ? providerValue.getIsDark
                                                  ? Colors.white10
                                                  : Colors.grey.shade300
                                              : Colors.transparent,
                                      padding: 20,
                                    ),
                                    index == 0 && showElectronics
                                        ? AnimatedContainer(
                                            color: Colors.transparent,
                                            height: showElectronics ? null : 0,
                                            duration: Duration(seconds: 3),
                                            child: ListView.builder(
                                                itemCount:
                                                    ElectronicsSubCategoreisList
                                                        .length,
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                itemBuilder: (context, index) =>
                                                    Column(
                                                      children: [
                                                        DrawerButtons(
                                                          title:
                                                              ElectronicsSubCategoreisList[
                                                                  index],
                                                          icon: null,
                                                          callBack: () {},
                                                          padding: 40,
                                                        ),
                                                      ],
                                                    )))
                                        : SizedBox()
                                  ],
                                ))),
                    DrawerButtons(
                        title: 'Wishlists', icon: Icons.star, callBack: () {}),
                    DrawerButtons(
                        title: 'My Account',
                        icon: Icons.person,
                        callBack: () {}),
                    DrawerButtons(
                        title:
                            providerValue.getIsDark ? 'Ligt Mode' : 'Dark Mode',
                        icon: providerValue.getIsDark
                            ? Icons.light_mode_rounded
                            : Icons.dark_mode_rounded,
                        callBack: () {
                          providerValue.setIsDark(!providerValue.getIsDark);
                        }),
                    DrawerButtons(
                        title: 'Settings',
                        icon: Icons.settings,
                        callBack: () {}),
                    DrawerButtons(
                        title: providerValue.getIsLoggedIn
                            ? 'Sign Out'
                            : 'Sign In',
                        icon: Icons.logout_outlined,
                        callBack: () {
                          providerValue.getIsLoggedIn
                              ? providerValue.setIsLoggedIn(false)
                              : Navigator.pushNamed(context, '/signin');
                        }),
                    DrawerButtons(
                        title: 'About Us', icon: Icons.info, callBack: () {}),
                    DrawerButtons(
                        title: 'Help', icon: Icons.help, callBack: () {}),
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}

class DrawerButtons extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Function()? callBack;
  double? padding;
  Color? optionalColor = Colors.transparent;
  DrawerButtons(
      {Key? key,
      required this.title,
      required this.icon,
      this.callBack,
      this.optionalColor,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          padding: EdgeInsets.only(left: padding == null ? 5 : padding!),
          primary: Colors.transparent,
          backgroundColor: optionalColor),
      child: Container(
        height: 40,
        child: Row(
          children: [
            Icon(icon, color: Colors.grey),
            SizedBox(
              width: 25,
            ),
            Text(
              title,
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyText1!.color,
                fontSize: 17,
              ),
            )
          ],
        ),
      ),
      onPressed: callBack,
    );
  }
}
