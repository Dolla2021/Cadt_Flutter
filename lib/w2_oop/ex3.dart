class Person {
  String name;
  int age;
  String job;
  String dateofbirth;
  final Address _address;

  Person(this.name, this.age, this.dateofbirth, this._address, this.job);

  String toString() {
    return 'Name: $name, Age: $age, Job: $job, DOB: $dateofbirth\nAddress: ${_address.toString()}';
  }
}

class Address {
  final String _street;
  final String _city;
  final String _zipCode;

  Address(this._street, this._city, this._zipCode);

  @override
  String toString() {
    return '$_street, $_city, $_zipCode';
  }
}

class BankAccount {
  final int accountID;
  final String accountOwner;
  double _balance;

  BankAccount(this.accountID, this.accountOwner) : _balance = 0;

  // get current balance
  double get balance => _balance;

  void withdraw(double amount) {
    if (_balance - amount < 0) {
      throw Exception('Insufficient amount for withdrawal!');
    }
    _balance -= amount;
    print('> Withdrew: \$${amount}.\n-> New Balance: \$$_balance');
  }

  void credit(double amount) {
    _balance += amount;
    print('> Credited \$${amount}.\n-> New Balance: \$$_balance');
  }
}

class Bank {
  String bankName;
  List<BankAccount> accounts = [];

  Bank(this.bankName);

  BankAccount createAccount(int accountID, String accountOwner) {
    // a condition ensure ID is unique
    for (var account in accounts) {
      // loop for all accounts
      if (account.accountID == accountID) {
        throw Exception('Account with this ID $accountID already exists!');
      }
    }
    var newAccount = BankAccount(accountID, accountOwner);
    accounts.add(newAccount);
    print('Account created for $accountOwner with ID $accountID');
    return newAccount;
  }
}

void main() {
  var address1 = Address('146E St', 'Phnom Penh', '1111');
  var person1 = Person('Por', 20, '2004-10-16', address1, 'Developer');
  print(person1);
  Bank myBank = Bank("CADT Bank");
  BankAccount PorAccount = myBank.createAccount(100, 'Por');
  print('\nBalance: \$${PorAccount.balance}'); // Balance: $0
  PorAccount.credit(100);

  print('\nBalance: \$${PorAccount.balance}'); // Balance: $100
  PorAccount.withdraw(50);

  print('\nFinal Balance: \$${PorAccount.balance}'); // Balance: $50

  try {
    PorAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Raj'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
