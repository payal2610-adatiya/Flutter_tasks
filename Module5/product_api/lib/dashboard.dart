
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:product_api/add_product.dart';
import 'package:product_api/productmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

class Dashboard extends StatefulWidget
{
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
{
  var data;
  late SharedPreferences sharedPreferences;

  @override
  void initState()
  {
    checkvalue();
  }

  getproducts() async
  {
    var url = Uri.parse("https://prakrutitech.xyz/API/productview.php");
    var resp = await http.get(url);
    return jsonDecode(resp.body);
  }
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(title: Text("Welcome $data"),
        actions:
        [
          IconButton(onPressed: ()
          {
            sharedPreferences.setBool("tops_login", true);
            Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => LoginScreen()));

          }, icon: Icon(Icons.logout))

        ],),
      body: FutureBuilder
        (
        future: getproducts(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot)
        {
          if(snapshot.hasError)
          {
            print("Network not found");
          }

          if(snapshot.hasData)
          {
            return ProductModel(list:snapshot.data);
          }
          return CircularProgressIndicator();
        },

      ),

      floatingActionButton: FloatingActionButton(onPressed: ()
      {
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => AddproductScreen()));
      },child: Icon(Icons.add),),
    );
  }

  checkvalue()async
  {
    sharedPreferences = await SharedPreferences.getInstance();

    setState(()
    {
      data = sharedPreferences.getString("myemail");
    });

  }
}
