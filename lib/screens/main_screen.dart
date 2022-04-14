import 'package:final_project/classes/json_loader.dart';
import 'package:flutter/material.dart';
int indList = 0;
class ListsBuilder extends StatefulWidget{
  const ListsBuilder({Key? key,}) : super (key: key);

  @override
  _ListsBuilderState createState() => _ListsBuilderState();
}


class _ListsBuilderState extends State<ListsBuilder>{

  @override
  Widget build(BuildContext context) {
    const textFieldStyle = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(36)),
      borderSide: BorderSide(
        width:0,
        color: Color(0xFFECEFF1),
      ),
    );
    const linkStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Color(0xFF0079D0),
    );

    // return MaterialApp(
    //   theme: ThemeData(
    //    fontFamily: 'Semi',
    //  ),
    //     home: Scaffold (
    return Container (
      child: const ListViewBuilder(),
    );
  }
}

/// ***** Виджет списка ******



/// ***** Виджет билдера ******
class ListViewBuilder extends StatefulWidget{
  const ListViewBuilder({Key? key}) : super (key: key);


  @override
  State<ListViewBuilder> createState() => _ListViewBuilderState();
}

class _ListViewBuilderState extends State<ListViewBuilder>{
 int _selectedIndex =0;
 // var list = new List<int>.generate(50, (i) => i++);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index){
        return Card(
          child: ListTile(
            //tileColor: Colors.green,
           // shape: RoundedRectangleBorder(side: BorderSide(color: Colors.cyan, width: 0), borderRadius: BorderRadius.circular(0)),
            //leading: const Icon(Icons.ac_unit),
            title: FutureBuilder<User>(
                      future: fetchUser(index),
                      builder: (context, snapshot) {
                        if (snapshot.hasData){
                          return Text("${snapshot.data!.id}. ${snapshot.data!.name} \ne-mail: ${snapshot.data!.email}");
                        }else if (snapshot.hasError){
                          return Text('${snapshot.error}');
                        }else{
                          return Text('Null');
                        }
                      }
                ),
            selected: index == _selectedIndex,
            onTap: () {
              setState(() {
                _selectedIndex = index;
                indList = index;
                Navigator.pushNamed(context, '/info');
                //print(_selectedIndex);
              });
            },
          ),
        );
      },
    );
    throw UnimplementedError();
  }
}




