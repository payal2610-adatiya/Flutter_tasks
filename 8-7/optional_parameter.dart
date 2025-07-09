/*void details(String name, [String? surname, String? email]) {
  print("Your Name is $name");
  if (surname != null) print("Your Surname is $surname");
  if (email != null) print("Your Email is $email");
}

void main() {
  details("vani", "padiya", "dev@gmail.com");
  print("-------------------------------------");
  details("Ajay", "Jani");
  print("-------------------------------------");
  details("Ajay");
}*/
import 'dart:io';

void details(String name, [var surname, var email]) {
  if(name == " ")
    {
      print("please enter your name");
    }

    if(name!=null) {
      print("Your Name is $name");
    }


  if (surname == null) print("Your Surname is $surname");
  //if (email != null) print("Your Email is $email");
  if (email == null) print("Your Email is $email");
}
void main()
{
  print("Enter your name");
  String name=stdin.readLineSync().toString();
  print("Enter your surname");
  var surname=stdin.readLineSync().toString();
  print("Enter your email");
  var email=stdin.readLineSync().toString();
  details(name,surname,email);
}

