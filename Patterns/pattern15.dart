import 'dart:io';

void main()
{
  for(int r=1;r<=6;r++)
    {
      for(int c=1;c<=6-r;c++)
        {
          stdout.write('*');
        }
      for(int space=1;space< (r*2-1);space++)
        {
          stdout.write(' ');
        }
      for (int i = 0; i < 6 - r; i++) {
        stdout.write('*');
      }
      print(' ');
    }

}