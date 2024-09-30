import 'dart:io';

class Vehicle {
  String name;
  double speed;

  Vehicle({required this.name, required this.speed});

  void move() {
    print('$name is moving at $speed km/h');
  }
}

class Car extends Vehicle {
  Car({required String name, required double speed}) : super(name: name, speed: speed);

  @override
  void move() {
    if (speed < 30){
      print('The $name car moves slow through traffic at $speed km/h');
    } else if (speed > 60){
      print('The $name car moves fast through traffic at $speed km/h');
    } else {
      print('The $name car moves at a moderate speed through traffic at $speed km/h');
    }
  }
}

class Bike extends Vehicle {
  Bike({required String name, required double speed}) : super(name: name, speed: speed);

  @override
  void move() {
    if (speed < 30){
      print('The $name bike moves slow through traffic at $speed km/h');
    } else if (speed > 60){
      print('The $name bike moves fast through traffic at $speed km/h');
    } else {
      print('The $name bike moves at a moderate speed through traffic at $speed km/h');
    }
  }
}

void main() {
  print('Do you want to create a Car or Bike?');
  print('1. Car');
  print('2. Bike');

  int choice = int.parse(stdin.readLineSync()!);

  if (choice == 1) {
    print('Enter the name of the car:');
    String namaMobil = stdin.readLineSync()!;
    print('Enter the speed of the car:');
    double Cepetga = double.parse(stdin.readLineSync()!);

    Car car = Car(name: namaMobil, speed: Cepetga);
    car.move();
  } else if (choice == 2) {
    print('Enter the name of the bike:');
    String namaSepeda = stdin.readLineSync()!;
    print('Enter the speed of the bike:');
    double kencangga = double.parse(stdin.readLineSync()!);

    Bike bike = Bike(name: namaSepeda, speed: kencangga);
    bike.move();
  } else {
    print('Invalid choice. Please choose a valid option.');
  }
}