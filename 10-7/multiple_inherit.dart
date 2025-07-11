class A{
  a()
  {

  }
}
class B{
  b()
  {

  }
}
class C implements A,B{
  c()
  {
    print("c class");
  }

  @override
  a() {
    print("a called");
  }

  @override
  b() {
print("b called");
  }
}
void main()
{
  var c=C();
  c.a();
  c.b();
  c.c();
}