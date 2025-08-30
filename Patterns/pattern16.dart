import 'dart:io';

void main()
{
  int n=5;
  for(int r=1;r<=n;r++)
    {
      for(int space=1;space<=n-r;space++)
        {
          stdout.write(' ');
        }
      for(int c=1;c<=r;c++)
        {
          stdout.write(' * ');
        }
      print(' ');
    }
  for(int r=n-1;r>=1;r--)
    {
      for(int s=1;s<=n-r;s++)
        {
          stdout.write(' ');
        }
      for(int c=1;c<=r;c++)
        {
          stdout.write(' * ');
        }
      print(' ');
    }
}