import 'dart:io';

void main()
{
  print("enter any no:");
  int n=int.parse(stdin.readLineSync().toString());
  int digit=0;
  while(n>0)
  {
    int rem=n%10;
    if(rem>digit)
      {
        digit=rem;
      }
    n=n~/10;
  }
  print(digit);
}

