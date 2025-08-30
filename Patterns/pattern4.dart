import 'dart:io';

void main() {
  int n = 5;

  for (int row = 1; row <= n; row++) {
    // print spaces
    for (int space = 1; space <= n - row; space++) {
      stdout.write(" ");
    }

    // print stars
    for (int star = 1; star <= row; star++) {
      stdout.write("*");
    }

    print(""); // move to next line
  }
}
// import 'dart:io';
//
// void main()
// {
//   int n=5;
//   for(int row=1;row<=n;row++)
//     {
//       for(int s=1;s<=n-row;s++)
//         {
//          stdout.write('');
//         }
//       for(int star=1;star<=row;star++)
//         {
//           stdout.write('*');
//         }
//       print(" ");
//     }
// }