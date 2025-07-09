import 'dart:io';

void main()
{
  print("ENTER ANY NUMBER ");
  int n=int.parse(stdin.readLineSync().toString());
  for(int i=1;i<=10;i++)
    {
      int ans=n*i;
      print("$n*$i=$ans");
    }
}