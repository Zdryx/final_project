import 'package:flutter/material.dart';

import 'main_screen.dart';
import '../classes/navigator_menu.dart';


class AuthScreen extends StatelessWidget {
  AuthScreen({Key? key}) : super(key: key);
  final _accessLogin = "1";
  final _accessPassword = "1";
  final _messengerKey = GlobalKey<ScaffoldMessengerState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    TextEditingController _login = TextEditingController();
    TextEditingController _password = TextEditingController();
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
    return Scaffold (
        body: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(height: 81,),
            Row(children: const [
              SizedBox(
                width: 103,
                height: 79,
                child: Image(

                  image: AssetImage("assets/bird_mini.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            const SizedBox(height: 19,),
            Row(children: const[
              Text(
                "Введите логин в виде 10 цифр \nномера телефона",
                textAlign: TextAlign.center,
                softWrap: true,
                style:TextStyle(
                  fontWeight: FontWeight.normal,
                  overflow: TextOverflow.visible,
                  fontSize:16,
                  color: Color(0x80000000),
                ) ,
              ),
            ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            const SizedBox(height: 33,),
            Row(children: [
              SizedBox( width: 244,
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      controller: _login,
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFECEFF1),
                          labelText: "Телефон",
                          enabledBorder: textFieldStyle,
                          focusedBorder: textFieldStyle,
                          hintText: "+7 (___) ___-__-__",
                      ),
                    ),
                  ),
            ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            const SizedBox(height: 20,),
            Row(children: [
              SizedBox( width: 244,
                child: TextField(
                  controller: _password,
                  obscureText: true,
                  obscuringCharacter: "*",
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFECEFF1),
                    labelText: "Пароль",
                    enabledBorder: textFieldStyle,
                    focusedBorder: textFieldStyle,
                  ),
                ),
              ),
            ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            const SizedBox(height: 28,),
            Row(children: [
              SizedBox( width: 154, height:42,
                child: ElevatedButton(
                  child: const Text("Войти"),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFF0079D0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(36.0),
                  ),),
                  onPressed: () {
                    if((_login.text == _accessLogin) & (_password.text == _accessPassword)){
                      Navigator.pushNamed(context, '/navigation');
                    }else{
                      _messengerKey.currentState!.showSnackBar(
                      const SnackBar(content: Text("Ошибка, попробуйте снова"),));
                    }
                    },
                ),
              ),
            ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            const SizedBox(height: 62,),
            Row(children: [
                InkWell(
                  child: const Text("Регистрация", style: linkStyle),
                  onTap: () { print("registration"); },
                ),
            ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            const SizedBox(height: 19,),
            Row(children: [
              InkWell(
                child: const Text("Забыли пароль?", style: linkStyle),
                onTap: () { print("registration"); },
              ),
            ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),

          ],),
        ),
    //  ),
   );
  }
}


