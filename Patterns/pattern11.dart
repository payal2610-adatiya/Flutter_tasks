import 'dart:io';

void main()
{
  for(int r=1;r<=5;r++)
    {
      for(int c=1;c<=r;c++)
        {
          if(c % 2 ==0 )
            {
              stdout.write('1');
            }
          else{
            stdout.write('0');
          }
        }
      print(' ');
    }
}