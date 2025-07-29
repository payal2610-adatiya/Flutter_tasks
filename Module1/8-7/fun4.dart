//without para without arg:
import 'dart:io';

add()
{
  print("enter any number");
  int a=int.parse(stdin.readLineSync().toString());
  print("enter any number");
  int b=int.parse(stdin.readLineSync().toString());
  int c=a+b;
  print("your ans is $c");
}
void main()
{
     add();
}