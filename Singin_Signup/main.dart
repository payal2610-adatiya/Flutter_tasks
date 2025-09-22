import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'login.dart';

void main() {
  runApp(MaterialApp(home: HomeScreen(),debugShowCheckedModeBanner: false,));
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Signup Form")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: name,
                  decoration: InputDecoration(hintText: "Enter Name"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Name is required";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: surname,
                  decoration: InputDecoration(hintText: "Enter Surname"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Surname is required";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: email,
                  decoration: InputDecoration(hintText: "Enter Email"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email is required";
                    }
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value)) {
                      return "Enter a valid email";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: password,
                  decoration: InputDecoration(hintText: "Enter Password"),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is required";
                    }
                    if (value.length < 6) {
                      return "Password must be at least 6 characters";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // All validations passed
                      String n = name.text.trim();
                      String s = surname.text.trim();
                      String e = email.text.trim();
                      String p = password.text.trim();

                      signup(n, s, e, p);

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    }
                  },
                  child: Text("Signup"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  signup(String n, String s, String e, String p) async {
    var url = Uri.parse("https://prakrutitech.xyz/API/insert.php");

    var response = await http.post(
      url,
      body: {
        "name": n,
        "surname": s,
        "email": e,
        "password": p,
      },
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Signup Success")));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Signup Failed")));
    }
  }
}