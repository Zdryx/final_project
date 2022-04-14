import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/main_screen.dart';

class NavigationMenu extends StatefulWidget{
   NavigationMenu({Key? key, required this.externalContainer}) : super (key: key);

  @override
  _NavigationMenuState createState() => _NavigationMenuState();
  Container externalContainer ;
  /*setExternalContainer(Container container){
    externalContainer = container;
  }*/

}


class _NavigationMenuState extends State<NavigationMenu>{
  //final _messengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold (
    appBar: AppBar(),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color:Colors.blue,
                ),
                child: Container(
                  height: 200,
                  child: Column(
                    children:  [
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        ),
                        child: SizedBox(
                            width: 100,
                            height: 70,
                            child: Image.network("https://miro.medium.com/max/1400/1*C1ovjT9NFzgFr_r5-E9shw.png")),
                      ),
                      const Text("Итоговый проект", ),

                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),

                ),
              ),
              ListTile(
                leading: const Icon(Icons.home_filled),
                title: const Text("Главная"),
                onTap:(){
                  NavigationMenu(externalContainer: Container(child: ListsBuilder()));//.setExternalContainer(Container(child: ListsBuilder()));
                  //Navigator.pushNamed(context, '/main_screen');
                },
              ),
              const Divider(),
              const Padding(
                padding: EdgeInsets.only(top: 20, left: 20),
                child: Text("Профиль", ),
              ),
              ListTile(
                leading: const Icon(Icons.input),
                title: const Text("Авторизация"),
                onTap:(){
                  //_messengerKey.currentState!.showSnackBar(
                  //  const SnackBar(content: Text("Переход в экран авторизации"),)
                  //  );
                  Navigator.pushNamed(context, '/');
                },
              ),
            ],
          ),
        ),
      //Загружаемые страницы в виде контейнера
      body: widget.externalContainer,
      );
  }
}



