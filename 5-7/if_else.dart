import 'dart:io';
void main()
{
  print("Enter any number");
  int num=int.parse(stdin.readLineSync().toString());
  if(num<=0)
    {
      print("negative");
    }
  else
    {
      print("positive");
    }
}