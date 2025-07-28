
class A
    {
  a()
  {

  }
}
class B extends A
{
  b()
  {

  }
}
class C extends A
{
  c()
  {

  }
}
class D implements B,C
{
  @override
  a()
  {
    print("a called");
  }

  @override
  b() {
    print("b called");
  }

  @override
  c() {
    print("c called");
  }
  d()
  {
    print("d called");
  }

}
void main()
{
  var d = D();
  d.a();
  d.b();
  d.c();
  d.d();
}