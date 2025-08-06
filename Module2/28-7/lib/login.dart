import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dashboard.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late String email1,password1;
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  final _fkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page ",style: TextStyle(color: Colors.brown,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.white60,
      ),
      body:
      Form
        (
          key: _fkey,
          child: Padding(
              padding: const EdgeInsets.all(19.0),
             child:Column(
               children: [
                 TextFormField(
                   controller: email,
                   decoration: InputDecoration(hintText: "Enter email",border: OutlineInputBorder(borderSide: BorderSide(width: 5.0))),
                   validator: (val){
                     if(val!.isEmpty)
                       {
                         return 'Please enter proper email';

                       }
                     return null;

                   }
                 ),
                 SizedBox(height: 10,),
                 TextFormField(
                   controller: password,
                   decoration: InputDecoration(hintText: "Enter password",border: OutlineInputBorder(borderSide: BorderSide(width: 5.0)) ),
                   obscureText: true,
                   validator: (val)
                     {
                       if(val!.isEmpty)
                       {
                         return 'Please enter proper email';

                       }
                       return null;

                     }),
                 SizedBox(height: 10,),
                 ElevatedButton(onPressed: ()
                     {
                       if(_fkey.currentState!.validate())
                         {
                           email1=email.text.toString();
                           password1=password.text.toString();
                           if(email1=="payal@gmail.com" && password1=="2610")
                             {
                               ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Logged in Successfully ")));
                               Navigator.push(context,MaterialPageRoute(builder: (context)=>Dashboard()));

                             }
                           else
                             {
                               ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid Credentials")));

                             }
                         }
                     }, child: Text("Login"))
                 


               ],

          ),
      )
      ),
    );
  }
}
