import 'dart:io';

void main()
{
  print("PLEASE ENTER YOUR AGE");
  int age=int.parse(stdin.readLineSync().toString());
  if(age>=18)
    {
      print("YOU ARE ELIGIBLE TO VOTE");
      if(age>=60)
        {
          print("YOU ARE UNDER SENIOR CITIZEN CATEGORY");
        }
      else
      {
       print("YOU ARE UNDER YOUNG AGE CATEGORY");
      }
    }
  else
    {
      print("YOU ARE NOT ELIGIBLE TO VOTE");
    }
}