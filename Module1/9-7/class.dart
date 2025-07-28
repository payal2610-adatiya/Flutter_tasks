class Emp {
  var name;
  var salary;
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
  print("your name is ${e.name}");
  print("your salary is ${e.salary}");
  print("your name is ${e1.name}");
  print("your salary is ${e1.salary}");
  print("your name is ${e2.name}");
  print("your salary is ${e2.salary}");
}