import 'dart:io';

void main()
{
  for(int row=1;row<=5;row++)
    {
      for(int space=1;space<=5-row;space++)
        {
          stdout.write(' ');
        }
      for(int col=1;col<=2*row-1;col++)
        {
          stdout.write('*');
        }
      print(' ');
    }
}