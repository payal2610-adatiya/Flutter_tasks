//area of circle
import 'dart:io';

area({var PI=3.14,var r})
{
  var a=PI*r*r;
  print(a);
}
void main()
{
  print("ENTER RADIUS");
  var b=int.parse(stdin.readLineSync().toString());
  area(r:b);
}
