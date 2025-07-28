import 'dart:io';

void main() {
  stdout.write("Enter a anything to reverse ");
  int n = int.parse(stdin.readLineSync().toString());
  int rev=0;

  while (n > 0) {
    int a=n % 10;
    rev=rev*10+a;
    n=n ~/ 10;
  }
  print("Reversed : $rev");
}
