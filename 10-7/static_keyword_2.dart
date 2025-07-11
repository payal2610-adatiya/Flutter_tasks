class Emp
{
  var name,surname;
 static var company_nm="Abc";
  Emp(this.name,this.surname);
  display()
  {
    print("YOUR NAME IS $name");
    print("YOUR SURNAME IS $surname");
    print("YOUR COMPANY NAME IS $company_nm");
  }
  static change()
  {
    company_nm="Bbc";
  }
}
void main()
{
  var e=Emp("Payal", "Adatiya");
  var e1=Emp("Vani", "Bosmia");
  var e2=Emp("Mishri", "Khakhariya");
  Emp.change();
  e.display();
  e1.display();
e2.display();
}