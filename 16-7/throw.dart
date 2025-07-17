import 'dart:io';

void main()
{
  print("enter your age");
  int age=int.parse(stdin.readLineSync().toString());
  check_age(age);
}

void check_age(int age) {
  if(age<18)
    {
      throw Exception("not eligible to vote");
    }
  else
    {
      print("eligible to vote");
    }
}
