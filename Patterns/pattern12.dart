import 'dart:io';

void main()
{
  for(int r=1;r<=5;r++)
    {
      int val=r*r;
      for(int c=1;c<=r;c++)
        {
          stdout.write(val);
        }
      print(' ');
    }
}