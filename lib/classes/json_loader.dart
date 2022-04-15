import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


Future<User> fetchUser(int index) async{
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
  if(response.statusCode == 200){
    return User.fromJson(jsonDecode(response.body)[index]);
  }else{
    throw Exception('Ошибка загрузки');
  }
}

Future<Task> fetchTask(int taskNumber, int userId) async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos?userId=$userId'));
    if(response.statusCode == 200){
      return Task.fromJson(jsonDecode(response.body)[taskNumber]);
    }else{
      throw Exception('Ошибка загрузки');
    }
}

class User{
  final int id;
  final String name;
  final String username;
  final String email;
  Map<String, dynamic> address;
  final String phone;
  final String website;
  Map<String, dynamic> company;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
});

  int ind = 0;
  setIndex(int ind){
    ind=ind;
  }

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      address: json['address'],
      phone: json['phone'],
      website: json['website'],
      company: json['company']
    );
  }

}

class Task{
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Task({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  int ind = 0;
  setIndex(int ind){
    ind=ind;
  }

  factory Task.fromJson(Map<String, dynamic> json){
    return Task(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        completed: json['completed'],
    );
  }

}

class HTTPStatefulWidget extends StatefulWidget{
  const HTTPStatefulWidget({Key? key, required this.index}) : super (key: key);
  final int index;
  @override
  State<HTTPStatefulWidget> createState() => _HTTPStatefulWidgetState();
}

class _HTTPStatefulWidgetState extends State<HTTPStatefulWidget>{
  late Future<User> futureUser;
  late Future<Task> futureTask;

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: const Text("Пользователь"),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(height: 10,),
          Container(
              child: FutureBuilder<User>(
                  future: fetchUser(widget.index),
                  builder: (context, snapshot) {
                    if (snapshot.hasData){
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text("${snapshot.data!.id}. ${snapshot.data!.name} \n\nUserName: ${snapshot.data!.username} \nE-MAIL: ${snapshot.data!.email}\naddress: st.${snapshot.data!.address["street"]}, suite ${snapshot.data!.address["suite"]}, city ${snapshot.data!.address["city"]} \nzipcode: ${snapshot.data!.address["zipcode"]} \ngeo: ${snapshot.data!.address["geo"]['lat']},${snapshot.data!.address["geo"]['lng']} \nphone: ${snapshot.data!.phone} \nwebsite: ${snapshot.data!.website} \ncompany: ${snapshot.data!.company["name"]}, ${snapshot.data!.company["catchPhrase"]},${snapshot.data!.company["bs"]}",
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              overflow: TextOverflow.visible,
                              fontSize:20,
                              color: Color(0x80000000),
                            ),
                        ),
                      );
                    }else if (snapshot.hasError){
                      return Text('${snapshot.error}');
                    }else{
                      return const CircularProgressIndicator();
                    }
                  }
              )
          ),
          const SizedBox(height: 10,),
          //Container(
          Container(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
                  itemCount: 20,
                  itemBuilder: (BuildContext context, int index){
                   // return Card(
                    return ListTile(
                      
                        //tileColor: Colors.green,
                        // shape: RoundedRectangleBorder(side: BorderSide(color: Colors.cyan, width: 0), borderRadius: BorderRadius.circular(0)),
                        //leading: const Icon(Icons.ac_unit),
                        title: FutureBuilder<Task>(
                            future: fetchTask(index, widget.index+1),
                            builder: (context, snapshot) {
                              if (snapshot.hasData){
                                return Text("Task: ${snapshot.data!.id}. ${snapshot.data!.title} \ncompleted: ${snapshot.data!.completed}",
                                  style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  overflow: TextOverflow.visible,
                                  fontSize:20,
                                  color: Color(0x80000000),
                                ),);
                              }else if (snapshot.hasError){
                                return Text('${snapshot.error}');
                              }else{
                                return Text('Null');
                              }
                            }
                        ),
                        onTap: () {
                          setState(() {});
                        },
                      );
                   // );
                  },
                ),
          ),
            /*
              child: FutureBuilder<Task>(
                  future: fetchTask(widget.index, userId),
                  builder: (context, snapshot) {
                    if (snapshot.hasData){
                      return Column(
                        children: [
                          Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Text("Task:\n${snapshot.data!.userId}.${snapshot.data!.id} ${snapshot.data!.title} \nResult: ${snapshot.data!.completed}",
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              overflow: TextOverflow.visible,
                              fontSize:20,
                              color: Color(0x80000000),
                            ),
                          ),
                        ),
                         Checkbox(
                            checkColor: Colors.white,
                           // fillColor: MaterialStateProperty.resolveWith(getColor),
                            value: snapshot.data!.completed,
                            onChanged: (bool? value) {
                              setState(() {
                              value!=snapshot.data!.completed;});
                            },
                         ),
                    ]);
                    }else if (snapshot.hasError){
                      return Text('${snapshot.error}');
                    }else{
                      return const CircularProgressIndicator();
                    }
                  }
              )*/
         // ),
        ],
          mainAxisAlignment: MainAxisAlignment.start,
        ),
      ),
      // ),
    );
    throw UnimplementedError();
  }
  
}