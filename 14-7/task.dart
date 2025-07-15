import 'dart:io';
void main() {
  String uname = "tops";
  String pass = "1234";
  print("Enter your username");
  var name = stdin.readLineSync().toString();
  print("Enter your password");
  var password = stdin.readLineSync().toString();

  if (name == uname && password == pass) {
    print("Enter your table number ");
    int table_no = int.parse(stdin.readLineSync().toString());
    int total_amt = 0;
    String items = "";

    while (true) {
      print("\n MENU");
      print("1. Pizza - Rs.100");
      print("2. Burger - Rs.120");
      print("3. Sandwich - Rs.90");
      print("4. Garlic Bread - Rs.50");
      print("5. Tacos - Rs.150");
      print("6. Cold Drink - Rs.20");
      print("7. Done");
      print("Enter your order choice");
      int choice = int.parse(stdin.readLineSync().toString());

      switch (choice) {
        case 1:
          total_amt += 100;
          items += "Pizza - Rs.100\n";
          print("ordered");
          break;
        case 2:
          total_amt += 120;
          items += "Burger - Rs.120\n";
          print("ordered");
          break;
        case 3:
          total_amt += 90;
          items += "Sandwich - Rs.90\n";
          print("ordered");
          break;
        case 4:
          total_amt += 50;
          items += "Garlic Bread - Rs.50\n";
          print("ordered");
          break;
        case 5:
          total_amt += 150;
          items += "Tacos - Rs.150\n";
          print("ordered");
          break;
        case 6:
          total_amt += 20;
          items += "Cold Drink - Rs.20\n";
          print("ordered");
          break;
        case 7:
          print("\n Table Number: $table_no");
          print("Ordered Items:");
          print(items);
          print("Total bill :$total_amt");
          var fout = File("D://bills.txt");
          String bill = "Table No: $table_no \n Ordered Items: \n $items \n Total Bill: Rs.$total_amt";
          fout.writeAsString(bill);
          print("Bill generated");
          return;
        default:
          print("Invalid item");
      }
    }
  } else {
    print("Username and password not matched");
  }
}


