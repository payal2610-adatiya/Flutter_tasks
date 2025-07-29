import 'dart:io';

void main()
{
  int f=0,l=0,sum=0;
  print("ENTER ANY NUMBER");
  int n=int.parse(stdin.readLineSync().toString());
  l=n%10;
  while(n>=10)
  {
    n~/=10;
  }
  f=n;
  sum=f+l;
print("SUM OF FIRST AND LAST DIGIT IS $sum");
}