import 'dart:io';

void main() {
  print("Enter a number:");
  int gfg = int.parse(stdin.readLineSync() ?? '0');

  switch (gfg) {
    case 1:
    case 2:
      print(" number 1 or 2");
      break;
    case 3:
      print(" number 3");
      break;
    default:
      print("This is the default case");
      break;
  }
}