class A{
  var _id;

  get id => _id;

  set id(value) {
    _id = value;
  }

}
void main()
{
  A a=A();
  a.id=11;
  print(a.id);
}