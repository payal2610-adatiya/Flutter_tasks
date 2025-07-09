//without para with arg:
import 'dart:io';

add()
{
  print("enter any number");
  int a=int.parse(stdin.readLineSync().toString());
  print("enter any number");
  int b=int.parse(stdin.readLineSync().toString());
  int c=a+b;
  return c;
}
void main()
{
  print("your ans is ${add()}");
}