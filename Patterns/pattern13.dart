import 'dart:io';

void main()
{
  for(int r=1;r <=5;r++)
    {
      for(int c=1;c<=r;c++)
        {
          stdout.write('*');
        }
      print(' ');
    }
  for(int r=5-1; r>=1; r--)
    {
      for(int c=1;c<=r;c++)
        {
          stdout.write('*');
        }
      print(' ');
    }
}