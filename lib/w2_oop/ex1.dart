// import 'dart:convert';

enum Skill { FLUTTER, DART, OTHER }

class Address {
  final String _street;
  final String _city;
  final String _zipCodes;

  Address(this._street, this._city, this._zipCodes);

// to read the private attributes
  String get street => _street;
  String get city => _city;
  String get zipCodes => _zipCodes;

  void printAddress() {
    print("Address: $_street, $_city, $_zipCodes");
  }
}

class Employee {
  final String _name;
  final double _baseSalary;
  final List<Skill> _skills;
  final int _yearOfexperience;
  final Address _address;

//regular constructor
  Employee(this._name, this._baseSalary, this._yearOfexperience, this._address,
      this._skills);

//named constructor for mobile developer
  Employee.mobileDeveloper(String name, Address address, int yearOfexperience)
      : _name = name,
        _address = address,
        _yearOfexperience = yearOfexperience,
        _baseSalary = 10000,
        _skills = [Skill.FLUTTER, Skill.DART];

//getter
  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills => _skills;
  int get yearOfexperience => _yearOfexperience;
  Address get address => _address;

  //method to computer the salary
  double computeSalary() {
    double salary = 40000;
    salary += _yearOfexperience * 2000;

    //bonus
    for (var skill in _skills) {
      if (skill == Skill.DART) {
        salary += 3000;
      } else if (skill == Skill.FLUTTER) {
        salary += 5000;
      } else if (skill == Skill.OTHER) {
        salary += 1000;
      }
    }
    return salary;
  }

  void printDetails() {
    print(
        'Employee: $_name, Salary: \$${computeSalary()}, Year of Experience : $_yearOfexperience');
    print(
        'Skills: ${_skills.map((skill) => skill.toString().split('.').last).join(', ')}');
  }
}

void main() {
  var address1 = Address('146E St', 'Phnom Penh', '6604');
  var emp1 = Employee('Sokea', 40000, 5, address1, [Skill.DART, Skill.FLUTTER]);
  emp1.printDetails();

  var address2 = Address('St 13', 'Phnom Penh', '1100');
  var emp2 = Employee.mobileDeveloper('Sou', address2, 7);
  emp2.printDetails();
}
