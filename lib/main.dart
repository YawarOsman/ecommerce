import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'models/dbConnection.dart';
import 'provider.dart';
import 'screens/signin.dart';
import 'screens/signup.dart';

import 'package:provider/provider.dart';
import 'screens/mainScreen.dart';

void main() async {
  await dotenv.load();
  runApp(
      ListenableProvider(create: (context) => ClassProvider(), child: MyApp()));

  DbCon().connection();
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ecommerce',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.light(),
          iconTheme: IconThemeData(color: Colors.black),
          textTheme: TextTheme(bodyText1: TextStyle(color: Colors.black)),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
          )),
      darkTheme: ThemeData(
          scaffoldBackgroundColor: Colors.grey.shade900,
          colorScheme: ColorScheme.dark(),
          iconTheme: IconThemeData(color: Colors.white),
          textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white)),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.grey.shade900,
          )),
      themeMode: Provider.of<ClassProvider>(context).currentTheme(),
      initialRoute: '/home',
      routes: <String, WidgetBuilder>{
        '/home': (context) => MainScreen(),
        '/signin': (context) => SignIn(),
        '/signup': (context) => SignUp()
      },
      home: MainScreen(),
    );
  }
}
