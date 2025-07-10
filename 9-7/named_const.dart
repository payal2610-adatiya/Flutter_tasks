
class A
{
  int id=0;
  String name="";

  A({var i,var n})
  {
    id = i;
    name = n;
  }
  A.a({var i})
  {
    id = i;

  }
  A.b({var i})
  {
    id = i;

  }
  display()
  {
    print("Your id is $id and Your name is $name");
  }
}
void main()
{
  A a1 = A(i:1,n:"abc");
  A a2 = A.a(i:2);
  A a3 = A.b(i:3);
  a1.display();
  a2.display();
  a3.display();
}
