import 'dart:io';

void main()
{
  int n=5;
  int num=1;
  for(int r=1;r<=n;r++)
    {
      for(int c=1;c<=r;c++)
        {
          stdout.write('$num ');
          num++;
        }
      print(' ');
    }
}