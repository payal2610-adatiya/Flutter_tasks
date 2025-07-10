class Emp {
  var name;
  var salary;
  display()
  {
    print("your name is ${name}");
    print("your salary is ${salary}");
  }
}
void main()
{
  Emp e=Emp();
  Emp e1=Emp();
  Emp e2=Emp();
  e.name="vani";
  e.salary=123456;
  e1.name="payal";
  e1.salary=1234560;
  e2.name="jay";
  e2.salary=12346;
  e.display();
  e1.display();
  e2.display();
}