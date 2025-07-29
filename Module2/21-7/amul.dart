import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(MaterialApp(home: amul(),debugShowCheckedModeBanner: false,));
}

class amul extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("AMUL PRODUCTS "),
      backgroundColor: Colors.grey,

    ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("ButterMilk",style:TextStyle(fontSize: 20),),
            SizedBox(height: 10,),
            Image.asset("assets/buttermilk.jpg",width: 150,height: 200,),
            Text("Butter",style:TextStyle(fontSize: 20),),
            SizedBox(height: 10,),
            Image.asset("assets/buttter.jpg",width: 150,height: 200,),
            Text("Cheese",style:TextStyle(fontSize: 20),),
            SizedBox(height: 10,),
            Image.asset("assets/cheese.jpg",width: 150,height: 200,),
            Text("Curd",style:TextStyle(fontSize: 20),),
            SizedBox(height: 10,),
            Image.asset("assets/curd.jpg",width: 150,height: 200,),
            Text("Cow Milk",style:TextStyle(fontSize: 20),),
            SizedBox(height: 10,),
            Image.asset("assets/cow_milk.jpg",width: 150,height: 200,),
            Text("Ice Cream",style:TextStyle(fontSize: 20),),
            SizedBox(height: 10,),
            Image.asset("assets/icecream.jpg",width: 150,height: 200,),
            Text("Milk",style:TextStyle(fontSize: 20),),
            SizedBox(height: 10,),
            Image.asset("assets/milk.jpg",width: 150,height: 200,),
            Text("Panchamrit",style:TextStyle(fontSize: 20),),
            SizedBox(height: 10,),
            Image.asset("assets/panchamri.jpg",width: 150,height: 200,),
            Text("Juice",style:TextStyle(fontSize: 20),),
            SizedBox(height: 10,),
            Image.asset("assets/refresh.jpg",width: 150,height: 200,),
            Text("Shrikhand",style:TextStyle(fontSize: 20),),
            SizedBox(height: 10,),
            Image.asset("assets/shrikhand.jpg",width: 150,height: 200,),

          ],
        ),

      ),
    );

  }
}
