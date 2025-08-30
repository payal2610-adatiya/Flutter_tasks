import 'dart:io';

void main()
{
  int n=4;
  for(int r=n;r>=1;r--)
    {
      for(int c=1;c<=r;c++)
        {
          stdout.write(c);
        }
      print(' ');
    }
}