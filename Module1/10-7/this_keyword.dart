class A{
  var id,name;
  A(var this.id,var this.name);
  display()
  {
    print("YOUR ID IS $id AND YOUR NAME IS $name");
  }
}
void main()
{
 var a=A(1,"abc");
 var a1=A(2,"ac");
 var a2=A(3,"ab");
 a.display();
 a1.display();
 a2.display();
}