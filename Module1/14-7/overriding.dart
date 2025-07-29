class RBI
{
  int rate()
  {
    return 0;
  }
}
class SBI extends RBI
{
  int rate()
  {
    return 3;
  }
}
class ICICI extends RBI
{
  int rate()
  {
    return 4;
  }
}
class AXIS extends RBI
{
  int rate()
  {
    return 5;
  }
}
void main()
{
  RBI r;
  r = SBI();
  print(r.rate());

  r = ICICI();
  print(r.rate());

  r = AXIS();
  print(r.rate());


}