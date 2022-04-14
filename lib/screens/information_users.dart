import 'package:final_project/classes/json_loader.dart';
import 'package:flutter/material.dart';
import 'package:final_project/screens/main_screen.dart';


class InformationScreen extends StatefulWidget{
  const InformationScreen({Key? key}) : super (key: key);

  @override
  _InformationScreenState createState() => _InformationScreenState();
}


class _InformationScreenState extends State<InformationScreen>{

  @override
  Widget build(BuildContext context) {
    return HTTPStatefulWidget(index: indList);

  }
}