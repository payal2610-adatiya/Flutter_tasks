import 'dart:io';

void main()
{
   pattern(5);
}
void pattern(int n)
{
  for(int row=1;row<=n;row++)
    {
      for(int col=1;col<=n-row+1;col++)
        {
          stdout.write("*");
        }
      print(' ');
    }
}