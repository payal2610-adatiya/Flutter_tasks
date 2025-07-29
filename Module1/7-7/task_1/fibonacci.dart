import 'dart:io';

void main()
{
  print("ENTER THE LENGTH OF THE FIBONACCI SERIES");
  int n=int.parse(stdin.readLineSync().toString());
  int a=0,b=1;
  /*while(a<=n)
    {
      print(a);
      int c=a+b;
      a=b;
      b=c;
    }*/
  for (int i = 0; i < n; i++) {
    print(a);
    int c = a + b;
    a= b;
    b = c;
  }
}