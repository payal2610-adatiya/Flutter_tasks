import 'dart:io';

void main()
{
  print("ENTER YOUR NUMBER1");
  var num1=int.parse(stdin.readLineSync().toString());
  print("ENTER YOUR NUMBER2");
  var num2=int.parse(stdin.readLineSync().toString());
  var ans =num1+num2;
  print("ANSWER IS $ans");
}