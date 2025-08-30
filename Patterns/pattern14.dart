import 'dart:io';

void main()
{
  for(int r=5;r>=1;r--)
    {
      for(int s=1;s<=5-r;s++)
        {
          stdout.write(' ');
        }
      for(int c=1;c<=r;c++)
        {
          stdout.write('* ');
        }
      print(' ');
    }
}