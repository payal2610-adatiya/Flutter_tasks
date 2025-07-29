import 'dart:io';

void main()
{
  String my_pass="1234";
  print("enter your roll number");
  int r_no=int.parse(stdin.readLineSync().toString());
  print("enter your name");
  String name=stdin.readLineSync().toString();
  print("enter your salary");
  double salary=double.parse(stdin.readLineSync().toString());
  print("enter your password");
  String pass=stdin.readLineSync().toString();
if(pass==my_pass)
  {
    var fout=File("D://a.txt");
    String a="your roll number is $r_no\n your name is $name\nyour salary  is $salary";
    fout.writeAsString("YOUR DETAILS \n $a");


    print("success");
  }
else{
  print("password not matched");
}
}