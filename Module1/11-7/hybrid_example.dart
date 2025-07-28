class A
{
  a(int a){}
}
class B extends A
{
  b(int a){}
}
class C extends A
{
  c(int a){}
}
class D implements B,C
{
   var a1,b1,c1;
  d(){
    var ans=a1*b1*c1;
    print(ans);
  }

  @override
  a(int a) {
     a1=a;
  }

  @override
  b(int a) {
b1=a;
  }

  @override
  c(int a) {
c1=a;
  }
}
 void main()
 {
   var d1=D();
   d1.a(2);
   d1.b(2);
   d1.c(2);
   d1.d();
 }