void main() {
  int rows = 5;

  for (int i = 1; i <= rows; i++) {
    String line = '';

    for (int j = 1; j <= rows - i; j++) {
      line += ' ';
    }

    for (int k = 1; k <= 2 * i - 1; k++) {
      line += '*';
    }

    print(line);
  }
}