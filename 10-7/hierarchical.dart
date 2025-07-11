class Bank
{
  bank()
  {
    print("banking");
  }
}
class Current extends Bank
{
  current()
  {
    print("current");
  }
}
class Saving extends Bank
{
  save()
  {
    print("saving");
  }
}
 void main()
 {
   var c=Current();
   var s=Saving();
   c.bank();
   c.current();
   s.save();
 }