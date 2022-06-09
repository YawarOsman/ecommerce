import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/models/drawer.dart';
import 'package:ecommerce/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late MediaQueryData mediaQueryData;
  Color searchButtonColor = Colors.amber.shade600;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  List swipeImages = [
    "assets/images/3.jpeg",
    "assets/images/clothes-4.jpeg",
    "assets/images/5.jpeg",
    "assets/images/6.jpeg",
  ];
  List productImages = [
    "assets/images/4.jpeg",
    "assets/images/7.jpeg",
    "assets/images/clothes-1.jpeg",
    "assets/images/clothes-2.jpeg",
    "assets/images/clothes-3.jpeg",
    "assets/images/clothes-5.jpeg",
    "assets/images/clothes-6.jpeg",
    "assets/images/electronics-1.jpeg",
    "assets/images/electronics-2.jpeg",
    "assets/images/electronics-3.jpeg",
    "assets/images/electronics-4.jpeg",
    "assets/images/mechanic-1.jpeg",
    "assets/images/toys-1.jpeg",
    "assets/images/toys-2.jpeg",
    "assets/images/toys-3.jpeg",
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ClassProvider>(context, listen: false).IsDark();
      Provider.of<ClassProvider>(context, listen: false).IsLoggedIn();
    });
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    double sWidth = mediaQueryData.size.width;
    double sHeight = mediaQueryData.size.height;
    return Consumer<ClassProvider>(
      builder: (context, providerValue, _) => Scaffold(
        key: _scaffoldKey,
        drawer: DrawerWidget(
          mediaQueryData: mediaQueryData,
        ),
        appBar: AppBar(
          iconTheme: Theme.of(context).iconTheme,
          leading: Builder(
              builder: (context) => IconButton(
                  onPressed: () {
                    _scaffoldKey.currentState!.openDrawer();
                  },
                  icon: const Icon(
                    Icons.menu,
                    size: 30,
                  ))),
          actions: [
            Container(
              width: sWidth,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(),
                    Visibility(
                      visible: mediaQueryData.size.width > 700 ? true : false,
                      child: Container(
                        child: const Text(
                          '     MyWebsite',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.orange,
                          ),
                        ),
                      ),
                    ),
                    Row(children: [
                      Container(
                        width: kIsWeb ? mediaQueryData.size.width / 3 : 270,
                        height: 45,
                        decoration: BoxDecoration(
                            color: providerValue.getIsDark
                                ? Colors.white10
                                : Colors.black26,
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                topLeft: Radius.circular(10))),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Search',
                              hintStyle: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .color),
                              contentPadding: const EdgeInsets.only(left: 10),
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none),
                          cursorColor:
                              Theme.of(context).textTheme.bodyText1!.color,
                        ),
                      ),
                      GestureDetector(
                        onTapDown: (value) {
                          searchButtonColor = Colors.amber.shade700;
                          setState(() {});
                        },
                        onTapUp: (value) {
                          searchButtonColor = Colors.amber.shade600;
                          setState(() {});
                        },
                        child: Container(
                          width: 35,
                          height: 45,
                          child: Container(
                            margin: EdgeInsets.zero,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              color: searchButtonColor,
                            ),
                            child: const Icon(Icons.search),
                            padding: const EdgeInsets.only(right: 0),
                          ),
                        ),
                      )
                    ]),
                  ],
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: sHeight / 4,
                child: CarouselSlider(
                    options: CarouselOptions(
                      height: sHeight / 5,
                      autoPlay: true,
                    ),
                    items: swipeImages
                        .map((e) => Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Card(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(e)),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30))),
                                ),
                              ),
                            ))
                        .toList()),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 12, bottom: 10),
                      child: Text(
                        'All Products',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      )),
                  GridView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.all(1),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(productImages[index])),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 13, vertical: 7),
                              child: Column(
                                children: [
                                  Text(
                                    '\$45.6',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text('Name'),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: mediaQueryData.size.width < 500
                            ? 2
                            : mediaQueryData.size.width < 700
                                ? 3
                                : mediaQueryData.size.width < 900
                                    ? 4
                                    : 5,
                        childAspectRatio: sHeight / 1000),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
