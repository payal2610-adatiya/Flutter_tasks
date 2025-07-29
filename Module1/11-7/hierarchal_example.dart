import 'dart:io';

class Shape
{
  var a,b;
  get_val(int a,int b)
  {
    this.a=a;
    this.b=b;
  }
}
class Rec extends Shape
 {
  rec()
  {
    var area=a*b;
    print("AREA OF RECTANGLE IS $area");
  }
}
class Tri extends Shape
{
  tri()
  {
    var area=0.5*a*b;
    print("AREA OF TRIANGLE IS $area");
  }
}
void main()
{
  Rec r=Rec();
  Tri t=Tri();
  print("ENTER VALUE OF A");
  int a=int.parse(stdin.readLineSync().toString());
  print("ENTER VALUE OF B");
  int b=int.parse(stdin.readLineSync().toString());
  r.get_val(a, b);
  t.get_val(a, b);
 r.rec();
 t.tri();
}