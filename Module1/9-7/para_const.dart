//parameterize constructor
class Details
{
  var i,n;
  Details({var id, var name})
  {
     i=id;
     n=name;
  }
  display()
  {
    print("your id is $i");
    print("Your name is $n");
  }
}
void main()
{
  Details d=Details(id:1,name:"vijay");
  Details d1=Details(id:2,name:"ajay");
  Details d2=Details(id:3,name:"jay");
  d.display();
  d1.display();
  d2.display();
}