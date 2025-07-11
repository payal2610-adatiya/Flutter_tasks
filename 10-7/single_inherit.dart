class A {
  a()
  {
    print("Parent class");
  }
}
class B extends A{
  b()
  {
    print("Child class");
  }
}
void main()
{
  var b=B();
  b.a();
  b.b();

}