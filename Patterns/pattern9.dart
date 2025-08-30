import 'dart:io';

void main()
{ int n=5;
   for( int row=1;row<=n;row++)
     {
       for(int space=1;space <= n-row ;space++)
         {
           stdout.write(' ');
         }
       for(int col=1;col<=row;col++)
         {
           stdout.write('$row ');
         }
       print('');
     }
}