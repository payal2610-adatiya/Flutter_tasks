import 'dart:io';

void main()
{
  int n=4;
  for(int r=1;r<=n;r++)
  {
    for(int c=r;c<=n;c++)
    {
      stdout.write(c);
    }
    print(' ');
  }
}