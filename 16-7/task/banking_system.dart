import 'dart:io';

class BankAccount {
  final String name;
  double balance;
  static double totalBalance = 0;

  BankAccount(this.name, this.balance) {
    totalBalance += balance;
  }


  void deposit(double amount) {
    balance += amount;
    totalBalance += amount;
    print("Deposited $amount. New balance: $balance");
  }

  void withdraw(double amount) {
    if (balance >= amount) {
      balance -= amount;
      totalBalance -= amount;
      print("Withdrawn $amount. New balance: $balance");
    } else {
      print("Insufficient balance.");
    }
  }

  void displayBalance() {
    print("Balance: $balance");
  }
}

class SavingsAccount extends BankAccount {
  SavingsAccount(String super.name, double  super.balance) ;
}

class CheckingAccount extends BankAccount {
  CheckingAccount(String super.name, double super.balance) ;
}

void main() {
  SavingsAccount savings = SavingsAccount("name",0);
  CheckingAccount checking = CheckingAccount("name",0);

  while (true) {
    print("\n1. Deposit into Savings");
    print("2. Withdraw from Savings");
    print("3. Check Savings Balance");
    print("4. Deposit into Checking");
    print("5. Withdraw from Checking");
    print("6. Check Checking Balance");
    print("7. Exit");

    print("Enter choice:");
    int choice = int.parse(stdin.readLineSync().toString());

    switch (choice) {
      case 1:
        print("Enter amount:");
        double amount = double.parse(stdin.readLineSync().toString());
        if (amount != null)
          {
            savings.deposit(amount);
            break;
          }
      case 2:
        print("Enter amount:");
        double amount =double.parse(stdin.readLineSync().toString());
        if (amount != null) {
          savings.withdraw(amount);
          break;
        }
      case 3:
        savings.displayBalance();
        break;
      case 4:
        print("Enter amount:");
        double amount =double.parse(stdin.readLineSync().toString());
        if (amount != null) checking.deposit(amount);
        break;
      case 5:
        print("Enter amount:");
        double amount = double.parse(stdin.readLineSync().toString());
        if (amount != null) checking.withdraw(amount);
        break;
      case 6:
        checking.displayBalance();
        break;
      case 7:
        print("Total bank balance: ${BankAccount.totalBalance}");
        return;
      default:
        print("Invalid choice.");
    }
  }
}


