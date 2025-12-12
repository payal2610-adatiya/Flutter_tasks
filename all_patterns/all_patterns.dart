import 'dart:io';

void main() {
  int n = 5;

  print("\n--- Solid Square ---");
  solidSquare(n);

  print("\n--- Right Triangle ---");
  rightTriangle(n);

  print("\n--- Inverted Right Triangle ---");
  invertedRightTriangle(n);

  print("\n--- Pyramid ---");
  pyramid(n);

  print("\n--- Inverted Pyramid ---");
  invertedPyramid(n);

  print("\n--- Diamond ---");
  diamond(n);

  print("\n--- Hollow Square ---");
  hollowSquare(n);

  print("\n--- Number Triangle ---");
  numberTriangle(n);

  print("\n--- Number Pyramid ---");
  numberPyramid(n);

  print("\n--- Floyd's Triangle ---");
  floyd(n);

  print("\n--- Butterfly Pattern ---");
  butterfly(n);

  print("\n--- Hourglass Pattern ---");
  hourglass(n);

  print("\n--- Zig Zag ---");
  zigZag();
}

/*-----------------------------------------------------
 STAR PATTERNS
------------------------------------------------------*/

void solidSquare(int n) {
  for (int row = 1; row <= n; row++) {
    for (int col = 1; col <= n; col++) {
      stdout.write("*");
    }
    print("");
  }
}

void rightTriangle(int n) {
  for (int row = 1; row <= n; row++) {
    for (int col = 1; col <= row; col++) {
      stdout.write("*");
    }
    print("");
  }
}

void invertedRightTriangle(int n) {
  for (int row = 1; row <= n; row++) {
    for (int col = 1; col <= n - row + 1; col++) {
      stdout.write("*");
    }
    print("");
  }
}

void pyramid(int n) {
  for (int row = 1; row <= n; row++) {
    for (int s = 1; s <= n - row; s++) stdout.write(" ");
    for (int col = 1; col <= 2 * row - 1; col++) stdout.write("*");
    print("");
  }
}

void invertedPyramid(int n) {
  for (int row = 1; row <= n; row++) {
    for (int s = 1; s < row; s++) stdout.write(" ");
    for (int col = 1; col <= 2 * (n - row) + 1; col++) stdout.write("*");
    print("");
  }
}

void diamond(int n) {
  for (int row = 1; row <= n; row++) {
    for (int s = 1; s <= n - row; s++) stdout.write(" ");
    for (int col = 1; col <= (2 * row - 1); col++) stdout.write("*");
    print("");
  }

  for (int row = n - 1; row >= 1; row--) {
    for (int s = 1; s <= n - row; s++) stdout.write(" ");
    for (int col = 1; col <= (2 * row - 1); col++) stdout.write("*");
    print("");
  }
}

void hollowSquare(int n) {
  for (int row = 1; row <= n; row++) {
    for (int col = 1; col <= n; col++) {
      if (row == 1 || row == n || col == 1 || col == n) {
        stdout.write("*");
      } else {
        stdout.write(" ");
      }
    }
    print("");
  }
}

/*-----------------------------------------------------
 NUMBER PATTERNS
------------------------------------------------------*/

void numberTriangle(int n) {
  for (int row = 1; row <= n; row++) {
    for (int col = 1; col <= row; col++) stdout.write(col);
    print("");
  }
}

void numberPyramid(int n) {
  for (int row = 1; row <= n; row++) {
    for (int s = 1; s <= n - row; s++) stdout.write(" ");
    for (int i = 1; i <= row; i++) stdout.write("$i");
    for (int i = row - 1; i >= 1; i--) stdout.write("$i");
    print("");
  }
}

void floyd(int n) {
  int number = 1;
  for (int row = 1; row <= n; row++) {
    for (int col = 1; col <= row; col++) {
      stdout.write("$number ");
      number++;
    }
    print("");
  }
}

/*-----------------------------------------------------
 ADVANCED INTERVIEW PATTERNS
------------------------------------------------------*/

void butterfly(int n) {
  // upper wing
  for (int row = 1; row <= n; row++) {
    // left stars
    for (int i = 1; i <= row; i++) stdout.write("*");
    // spaces
    for (int i = 1; i <= 2 * (n - row); i++) stdout.write(" ");
    // right stars
    for (int i = 1; i <= row; i++) stdout.write("*");
    print("");
  }

  // lower wing
  for (int row = n; row >= 1; row--) {
    for (int i = 1; i <= row; i++) stdout.write("*");
    for (int i = 1; i <= 2 * (n - row); i++) stdout.write(" ");
    for (int i = 1; i <= row; i++) stdout.write("*");
    print("");
  }
}

void hourglass(int n) {
  for (int row = n; row >= 1; row--) {
    for (int s = 1; s <= n - row; s++) stdout.write(" ");
    for (int col = 1; col <= 2 * row - 1; col++) stdout.write("*");
    print("");
  }

  for (int row = 2; row <= n; row++) {
    for (int s = 1; s <= n - row; s++) stdout.write(" ");
    for (int col = 1; col <= 2 * row - 1; col++) stdout.write("*");
    print("");
  }
}

void zigZag() {
  for (int row = 1; row <= 3; row++) {
    for (int col = 1; col <= 9; col++) {
      if ((row + col) % 4 == 0 || (row == 2 && col % 4 == 0)) {
        stdout.write("*");
      } else {
        stdout.write(" ");
      }
    }
    print("");
  }
}
//output

// --- Solid Square ---
// *****
// *****
// *****
// *****
// *****
//
// --- Right Triangle ---
// *
// **
// ***
// ****
// *****
//
// --- Inverted Right Triangle ---
// *****
// ****
// ***
// **
// *
//
// --- Pyramid ---
// *
// ***
// *****
// *******
// *********
//
// --- Inverted Pyramid ---
// *********
// *******
// *****
// ***
// *
//
// --- Diamond ---
// *
// ***
// *****
// *******
// *********
// *******
// *****
// ***
// *
//
// --- Hollow Square ---
// *****
// *   *
// *   *
// *   *
// *****
//
// --- Number Triangle ---
// 1
// 12
// 123
// 1234
// 12345
//
// --- Number Pyramid ---
// 1
// 121
// 12321
// 1234321
// 123454321
//
// --- Floyd's Triangle ---
// 1
// 2 3
// 4 5 6
// 7 8 9 10
// 11 12 13 14 15
//
// --- Butterfly Pattern ---
// *        *
// **      **
// ***    ***
// ****  ****
// **********
// **********
// ****  ****
// ***    ***
// **      **
// *        *
//
// --- Hourglass Pattern ---
// *********
// *******
// *****
// ***
// *
// ***
// *****
// *******
// *********
//
// --- Zig Zag ---
// *   *
// * * * *
// *   *   *
//
