class Color
{
  var color="pink";

}
class Color2 extends Color
{
  var color="White";
  display()
  {
    print(color);
    print(super.color);
  }
}
void main()
{
  var c=Color2();
  c.display();
}