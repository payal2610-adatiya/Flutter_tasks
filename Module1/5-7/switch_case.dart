import 'dart:io';

void main()
{
  print("\n Press 1 For Gujarati \n Press 2 For Hindi \n Press 3 For English");
  int n = int.parse(stdin.readLineSync().toString());
  switch(n)
      {
    case 1:print("YOUR LANGUAGE IS GUJARATI");
    case 2:print("YOUR LANGUAGE IS HINDI ");
    case 3:print("YOUR LANGUAGE IS ENGLISH");

      }
}