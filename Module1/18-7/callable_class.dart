class Person{
 call(int age, String name)
  {
      return "the name of the person is $name and age is $age";
  }
}
void main()
{
  var p=Person();
  var p1=p(21,"abc");
  print(p);
  print(p1);
}