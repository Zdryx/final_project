import 'package:final_project/classes/json_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:final_project/screens/auth_screen.dart';
import 'package:final_project/classes/navigator_menu.dart';

import 'information_users.dart';
import 'main_screen.dart';

class NavigationWidget extends StatefulWidget{
  const NavigationWidget ({Key? key}) : super (key: key);

  @override
  _NavigationWidgetState createState() => _NavigationWidgetState();
}


class _NavigationWidgetState extends State<NavigationWidget>{
  final _messengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     // theme:globalTheme(),
        initialRoute: '/',
        routes: {
          '/': (context) => AuthScreen(),
          //'/users': (context) => const HTTPStatefulWidget(),
          '/navigation': (context) => const NavigationScreen(),
          '/info': (context) => InformationScreen(),
        }
      //scaffoldMessengerKey: _messengerKey,
    );
  }
}


class NavigationScreen extends StatefulWidget{
  const NavigationScreen({Key? key}) : super (key: key);

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}


class _NavigationScreenState extends State<NavigationScreen>{
  final _messengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return NavigationMenu(externalContainer: Container(child: ListsBuilder()));

  }
}