import 'dart:io';

void main() {
  stdout.write("ENTER ANY NUMBER ");
  int n = int.parse(stdin.readLineSync()!);
  int sum = 0;
  while (n > 0) {
    sum += n % 10;
    n = n ~/ 10;
  }
  print("Sum of digits: $sum");
}

