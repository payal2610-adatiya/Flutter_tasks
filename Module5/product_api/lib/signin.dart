import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:product_api/login.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Page")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: name,
                obscureText: true,
                decoration: InputDecoration(hintText: "Enter Name"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your name";
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),
              TextFormField(
                controller: surname,
                decoration: InputDecoration(hintText: "Enter Surname"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your surname";
                  }

                  return null;
                },
              ),
              SizedBox(height: 24),
              TextFormField(
                controller: email,
                decoration: InputDecoration(hintText: "Enter Email"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email";
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return "Enter a valid email address";
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(hintText: "Enter Password"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your password";
                  }
                  if (value.length < 6) {
                    return "Password must be at least 6 characters";
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),
              ElevatedButton(onPressed: ()
              {
                String n = name.text.toString();
                String s = surname.text.toString();
                String e = email.text.toString();
                String p = password.text.toString();

                signup(n,s,e,p);

                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => LoginScreen()));

              }, child: Text("Signup")),
              TextButton(onPressed: ()
              {
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => LoginScreen()));
              }, child: Text("Login?"))


            ],
          ),
        ),
      ),
    );
  }

  void signup(String n, String s, String e, String p) {
    var url= Uri.parse("https://prakrutitech.xyz/API/insert.php");
    http.post(url,body:
    {
       "name":n,
      "surname":s,
      "email":e,
       "password":p
    }
    );
  }

}