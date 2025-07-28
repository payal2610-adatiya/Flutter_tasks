import 'dart:io';

void main()
{
  print("enter your age");
  int age=int.parse(stdin.readLineSync().toString());
  if(age<=18)
    {
      print("young");
    }
  else
    {
      print("adult");
    }
}