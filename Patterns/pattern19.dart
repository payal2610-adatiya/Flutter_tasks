import 'dart:io';

void main()
{
  int n=5;
  for(int r=1;r<=n;r++)
    {
      for(int c=1;c<=r;c++)
        {
          if(c%2==0)
            {
              stdout.write('*');
            }
          else{
            stdout.write('#');
          }
        }
      print(' ');
    }
}