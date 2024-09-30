  import 'dart:io';
  void main() {
  print('Temperature Conversion Program');
  print('---------------------------');

  print('Enter the temperature in Celsius:');
  double celsius = double.parse(stdin.readLineSync()!);

  print('Choose the conversion option:');
  print('1. Reaumur');
  print('2. Fahrenheit');
  print('3. Kelvin');
  print('4. All conversions');

  int option = int.parse(stdin.readLineSync()!);

  switch (option) {
    case 1:
      print('Reaumur conversion:');
      print('$celsius°C is equal to ${celsius * 0.8}°Ré');
      break;
    case 2:
      print('Fahrenheit conversion:');
      print('$celsius°C is equal to ${(celsius * 9 / 5) + 32}°F');
      break;
    case 3:
      print('Kelvin conversion:');
      print('$celsius°C is equal to ${celsius + 273.15} K');
      break;
    case 4:
      print('All conversions:');
      print('$celsius°C is equal to ${celsius * 0.8}°Ré');
      print('$celsius°C is equal to ${(celsius * 9 / 5) + 32}°F');
      print('$celsius°C is equal to ${celsius + 273.15} K');
      break;
    default:
      print('Invalid option. Please choose a valid option.');
  }
}